import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

import '../../../data/models/tplink/tplink_models.dart';
import 'tplink_crc32.dart';

/// Full implementation of TP-Link Management Protocol (TMP) TCP client.
/// Connects to TP-Link router on TCP Port 20002, performs the 3-step
/// version/component handshake, authenticates with local credentials,
/// extracts the session token, and executes data query commands.
class TPLinkTmpClient {
  final String routerIp;
  final int port;

  Socket? _socket;
  int _sessionId = 0;
  int _sequenceNumber = 1;
  bool _isAuthenticated = false;

  final List<int> _receiveBuffer = [];
  Completer<Uint8List?>? _pendingCompleter;
  StreamSubscription<Uint8List>? _socketSubscription;

  TPLinkTmpClient({
    required this.routerIp,
    this.port = 20002,
  });

  /// Returns whether the client is connected and authenticated.
  bool get isAuthenticated => _isAuthenticated;

  /// Returns the current active session ID (token).
  int get sessionId => _sessionId;

  /// Connects to TCP socket and performs the full Negotiation & Login sequence.
  Future<bool> connectAndLogin(String username, String password, {Duration timeout = const Duration(seconds: 2)}) async {
    try {
      debugPrint('[TPLinkTmpClient] Connecting to $routerIp:$port...');
      _socket = await Socket.connect(routerIp, port, timeout: timeout);

      _socketSubscription = _socket!.listen(
        _onDataReceived,
        onError: _onError,
        onDone: _onDone,
      );

      // Step A: Version Negotiate Request (Msg ID 3841, pktCmd = 4)
      debugPrint('[TPLinkTmpClient] Step A: Sending Version Negotiate Request (Msg 3841)...');
      final versionOk = await _sendNegotiationStep(3841, timeout: const Duration(seconds: 3));
      if (!versionOk) {
        debugPrint('[TPLinkTmpClient] Version Negotiate Failed');
        await disconnect();
        return false;
      }

      // Step B: Version Negotiate Confirm (Msg ID 3843, pktCmd = 4)
      debugPrint('[TPLinkTmpClient] Step B: Sending Version Negotiate Confirm (Msg 3843)...');
      _sendRawPacket(msgId: 3843, pktCmd: 4);

      // Step C: Component Negotiate Request (Msg ID 3840, pktCmd = 4)
      debugPrint('[TPLinkTmpClient] Step C: Sending Component Negotiate Request (Msg 3840)...');
      final compOk = await _sendNegotiationStep(3840, timeout: const Duration(seconds: 3));
      if (!compOk) {
        debugPrint('[TPLinkTmpClient] Component Negotiate Failed');
        await disconnect();
        return false;
      }

      // Step D: Local Login Request (Msg ID 1, pktCmd = 5)
      debugPrint('[TPLinkTmpClient] Step D: Sending Login Request (Msg 1)...');
      final loginJson = {
        'username': username,
        'password': password,
        'terminal_id': 'TetherFlutter',
        'terminal_type': 1,
      };

      final response = await _sendRequest(msgId: 1, jsonPayload: loginJson, timeout: const Duration(seconds: 5));
      if (response != null && response.length >= 24) {
        final bd = ByteData.sublistView(response);
        _sessionId = bd.getUint32(8, Endian.big);
        final resultCode = bd.getUint8(21);

        if (resultCode == 0) {
          _isAuthenticated = true;
          debugPrint('[TPLinkTmpClient] Local Login Successful! Session ID (Token): $_sessionId');
          return true;
        } else {
          debugPrint('[TPLinkTmpClient] Login rejected with result code: $resultCode');
        }
      } else {
        debugPrint('[TPLinkTmpClient] No or invalid response received for Login request');
      }

      await disconnect();
      return false;
    } catch (e) {
      debugPrint('[TPLinkTmpClient] Connection or Login error: $e');
      await disconnect();
      return false;
    }
  }

  /// Sends a data request with [msgId] and optional [jsonPayload], returning decoded JSON.
  Future<Map<String, dynamic>?> sendDataRequest(int msgId, [Map<String, dynamic>? jsonPayload]) async {
    if (_socket == null) {
      throw Exception('Socket is not connected');
    }

    final response = await _sendRequest(msgId: msgId, jsonPayload: jsonPayload);
    if (response == null || response.length < 24) return null;

    final bd = ByteData.sublistView(response);
    final resultCode = bd.getUint8(21);
    if (resultCode != 0) {
      debugPrint('[TPLinkTmpClient] Request for Msg ID $msgId failed with result code $resultCode');
      return null;
    }

    if (response.length == 24) {
      return {'error_code': 0};
    }

    final payloadBytes = response.sublist(24);
    try {
      final jsonStr = utf8.decode(payloadBytes);
      final jsonMap = jsonDecode(jsonStr);
      if (jsonMap is Map<String, dynamic>) {
        return jsonMap;
      }
    } catch (e) {
      debugPrint('[TPLinkTmpClient] Failed to decode JSON payload for Msg $msgId: $e');
    }

    return null;
  }

  /// Query System & Device summary information (Msg ID 1024).
  Future<TPLinkDeviceInfo?> fetchDeviceInfo() async {
    final json = await sendDataRequest(1024);
    if (json != null) {
      return TPLinkDeviceInfo.fromJson(json);
    }
    return null;
  }

  /// Query connected devices list (Msg ID 1040).
  Future<List<TPLinkConnectedClient>> fetchConnectedClients() async {
    final json = await sendDataRequest(1040);
    if (json != null) {
      final list = json['client_list'] ?? json['hosts'] ?? json['result'];
      if (list is List) {
        return list.map((item) => TPLinkConnectedClient.fromJson(item as Map<String, dynamic>)).toList();
      }
    }
    return [];
  }

  /// Query Wi-Fi configuration (Msg ID 1800 or fallback 1056).
  Future<TPLinkWifiSettings?> fetchWifiSettings() async {
    var json = await sendDataRequest(1800);
    json ??= await sendDataRequest(1056);
    if (json != null) {
      return TPLinkWifiSettings.fromJson(json);
    }
    return null;
  }

  /// Query WAN / Internet status (Msg ID 2101 or fallback 2131).
  Future<TPLinkWanStatus?> fetchWanStatus() async {
    var json = await sendDataRequest(2101);
    json ??= await sendDataRequest(2131);
    if (json != null) {
      return TPLinkWanStatus.fromJson(json);
    }
    return null;
  }

  /// Query Firmware upgrade status (Msg ID 1687).
  Future<Map<String, dynamic>?> fetchFirmwareStatus() async {
    return await sendDataRequest(1687);
  }

  /// Sends Reboot command to router (Msg ID 1600).
  Future<bool> reboot() async {
    final res = await sendDataRequest(1600);
    return res != null && res['error_code'] == 0;
  }

  /// Sends LED Light Control command (Msg ID 1680).
  Future<bool> setLedStatus(bool enable) async {
    final res = await sendDataRequest(1680, {'led_enable': enable});
    return res != null && res['error_code'] == 0;
  }

  /// Sends Heartbeat keep-alive (Msg ID 3841 with pktCmd = 5).
  Future<bool> sendHeartbeat() async {
    final res = await sendDataRequest(3841);
    return res != null;
  }

  /// Sends Logout / Session Teardown command (Msg ID 2).
  Future<void> logout() async {
    try {
      if (_isAuthenticated && _socket != null) {
        await _sendRequest(msgId: 2, pktCmd: 5);
      }
    } catch (_) {}
    await disconnect();
  }

  /// Close socket connection and reset session state.
  Future<void> disconnect() async {
    _isAuthenticated = false;
    _sessionId = 0;
    _pendingCompleter?.complete(null);
    _pendingCompleter = null;
    await _socketSubscription?.cancel();
    _socketSubscription = null;
    _socket?.destroy();
    _socket = null;
    _receiveBuffer.clear();
    debugPrint('[TPLinkTmpClient] Socket disconnected and session cleared');
  }

  // --- Private Helper Methods ---

  Future<bool> _sendNegotiationStep(int msgId, {Duration timeout = const Duration(seconds: 3)}) async {
    final completer = Completer<Uint8List?>();
    _pendingCompleter = completer;

    final packet = buildPacket(msgId: msgId, pktCmd: 4);
    _socket?.add(packet);

    final resp = await completer.future.timeout(timeout, onTimeout: () => null);
    if (resp != null && resp.length >= 22) {
      final bd = ByteData.sublistView(resp);
      return bd.getUint8(21) == 0; // result code == 0
    }
    return false;
  }

  Future<Uint8List?> _sendRequest({
    required int msgId,
    int pktCmd = 5,
    Map<String, dynamic>? jsonPayload,
    Duration timeout = const Duration(seconds: 5),
  }) async {
    final completer = Completer<Uint8List?>();
    _pendingCompleter = completer;

    Uint8List payloadBytes = Uint8List(0);
    if (jsonPayload != null) {
      payloadBytes = Uint8List.fromList(utf8.encode(jsonEncode(jsonPayload)));
    }

    final packet = buildPacket(msgId: msgId, pktCmd: pktCmd, payload: payloadBytes);
    _socket?.add(packet);

    return completer.future.timeout(timeout, onTimeout: () => null);
  }

  void _sendRawPacket({required int msgId, required int pktCmd, Uint8List? payload}) {
    final packet = buildPacket(msgId: msgId, pktCmd: pktCmd, payload: payload);
    _socket?.add(packet);
  }

  /// Builds a 24-byte TMP header + optional payload, with magic CRC32 checksum.
  Uint8List buildPacket({
    required int msgId,
    required int pktCmd,
    Uint8List? payload,
    int? overrideSessionId,
    int? overrideSeqNum,
  }) {
    payload ??= Uint8List(0);
    final payloadLen = payload.length + 8; // 8 bytes subheader + body length
    final totalLen = 24 + payload.length;
    final packet = Uint8List(totalLen);
    final bd = ByteData.sublistView(packet);

    final currentSeq = overrideSeqNum ?? _sequenceNumber++;
    final currentSession = overrideSessionId ?? _sessionId;

    // --- Outer Header (16 Bytes) ---
    bd.setUint8(0, 1); // version
    bd.setUint8(1, 0); // type
    bd.setUint8(2, pktCmd); // pktCmd (4 = handshake, 5 = data, 6 = teardown)
    bd.setUint8(3, 0); // option
    bd.setUint16(4, payloadLen, Endian.big); // payload length
    bd.setUint8(6, currentSeq); // seq num
    bd.setUint8(7, 0); // reserved
    bd.setUint32(8, currentSession, Endian.big); // session_id (token)

    // Seed CRC field at offset 12 with Magic Seed 0x5A6B7C8D
    bd.setUint32(12, TPLinkCrc32.magicCrcSeed, Endian.big);

    // --- Sub-Header (8 Bytes) ---
    bd.setUint8(16, 1); // major ver
    bd.setUint8(17, 0); // minor ver
    bd.setUint16(18, msgId, Endian.big); // Message ID
    bd.setUint8(20, 0); // direction (0 = client to router)
    bd.setUint8(21, 0); // result code
    bd.setUint16(22, 0, Endian.big); // reserved

    // Copy Data Payload
    if (payload.isNotEmpty) {
      packet.setRange(24, totalLen, payload);
    }

    // Calculate CRC32 over the entire packet
    final crc = TPLinkCrc32.compute(packet);
    bd.setUint32(12, crc, Endian.big);

    return packet;
  }

  void _onDataReceived(Uint8List data) {
    _receiveBuffer.addAll(data);

    // Frame assembly: check if we have received a complete frame
    while (_receiveBuffer.length >= 24) {
      final bd = ByteData.sublistView(Uint8List.fromList(_receiveBuffer));
      final subHeaderLen = bd.getUint16(4, Endian.big); // payload length field
      final totalExpectedLen = 16 + subHeaderLen;

      if (_receiveBuffer.length < totalExpectedLen) {
        // Waiting for remaining bytes of the frame to arrive
        break;
      }

      final frameBytes = Uint8List.fromList(_receiveBuffer.sublist(0, totalExpectedLen));
      _receiveBuffer.removeRange(0, totalExpectedLen);

      if (_pendingCompleter != null && !_pendingCompleter!.isCompleted) {
        _pendingCompleter!.complete(frameBytes);
      }
    }
  }

  void _onError(dynamic error) {
    debugPrint('[TPLinkTmpClient] Socket error: $error');
  }

  void _onDone() {
    debugPrint('[TPLinkTmpClient] Socket connection closed by remote host');
    _isAuthenticated = false;
  }
}
