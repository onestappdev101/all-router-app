import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import '../../../data/models/tplink/tplink_models.dart';
import 'tplink_crc32.dart';

/// Implements TP-Link Discovery Protocol (TDP) over UDP Port 20002.
class TPLinkTdpDiscovery {
  static const int udpPort = 20002;

  /// Builds a 16-byte TDP discovery probe packet with magic CRC32 checksum.
  static Uint8List buildDiscoveryPacket({int sequenceNumber = 1}) {
    final packet = Uint8List(16);
    final bd = ByteData.sublistView(packet);

    bd.setUint8(0, 0x01); // version = 1
    bd.setUint8(1, 0x00); // type = 0
    bd.setUint16(2, 0x0002, Endian.big); // pkt_type = 2 (Discovery Request)
    bd.setUint16(4, 0x0000, Endian.big); // payload_len = 0
    bd.setUint8(6, 0x11); // option_1
    bd.setUint8(7, 0x01); // option_2
    bd.setUint32(8, sequenceNumber, Endian.big); // seq_num

    // Seed bytes 12..15 with magic seed 0x5A6B7C8D (1516993677)
    bd.setUint32(12, TPLinkCrc32.magicCrcSeed, Endian.big);

    // Compute CRC32 over the 16 bytes
    final crc = TPLinkCrc32.compute(packet);
    bd.setUint32(12, crc, Endian.big);

    return packet;
  }

  /// Broadcasts a TDP discovery packet over UDP port 20002 to locate local TP-Link routers.
  ///
  /// Returns a list of discovered [TdpDiscoveryResult] instances.
  static Future<List<TdpDiscoveryResult>> discover({
    Duration timeout = const Duration(seconds: 3),
    String targetAddress = '255.255.255.255',
  }) async {
    final results = <TdpDiscoveryResult>[];
    RawDatagramSocket? socket;

    try {
      socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      socket.broadcastEnabled = true;

      final packet = buildDiscoveryPacket();

      socket.send(packet, InternetAddress(targetAddress), udpPort);
      debugPrint('[TPLinkTdpDiscovery] Sent TDP discovery probe to $targetAddress:$udpPort');

      final completer = Completer<List<TdpDiscoveryResult>>();

      late StreamSubscription subscription;
      subscription = socket.listen((RawSocketEvent event) {
        if (event == RawSocketEvent.read) {
          final dg = socket?.receive();
          if (dg != null) {
            try {
              final parsed = parseDiscoveryResponse(dg.data, dg.address.address);
              if (parsed != null) {
                // Avoid duplicates
                if (!results.any((r) => r.ip == parsed.ip || r.mac == parsed.mac)) {
                  results.add(parsed);
                  debugPrint('[TPLinkTdpDiscovery] Discovered router: ${parsed.ip} (${parsed.model})');
                }
              }
            } catch (e) {
              debugPrint('[TPLinkTdpDiscovery] Error parsing response from ${dg.address.address}: $e');
            }
          }
        }
      });

      Timer(timeout, () {
        subscription.cancel();
        if (!completer.isCompleted) {
          completer.complete(results);
        }
      });

      return await completer.future;
    } catch (e) {
      debugPrint('[TPLinkTdpDiscovery] UDP Discovery failed: $e');
      return results;
    } finally {
      socket?.close();
    }
  }

  /// Parses TDP response byte array and extracts TLV attributes starting at byte offset 16.
  static TdpDiscoveryResult? parseDiscoveryResponse(Uint8List data, String senderIp) {
    if (data.length < 16) return null;

    final bd = ByteData.sublistView(data);
    final version = bd.getUint8(0);

    // Verify TDP header version (0x01)
    if (version != 0x01) return null;

    final tlvMap = <int, String>{};
    int offset = 16;

    while (offset < data.length) {
      if (offset + 2 > data.length) break;

      final tag = data[offset];
      final len = data[offset + 1];

      if (offset + 2 + len > data.length) {
        // Fallback for 2-byte length encoding if payload length exceeds single byte
        if (offset + 3 <= data.length) {
          final len2 = bd.getUint16(offset + 1, Endian.big);
          if (offset + 3 + len2 <= data.length) {
            final val = String.fromCharCodes(data.sublist(offset + 3, offset + 3 + len2)).trim();
            tlvMap[tag] = val;
            offset += 3 + len2;
            continue;
          }
        }
        break;
      }

      final val = String.fromCharCodes(data.sublist(offset + 2, offset + 2 + len)).trim();
      tlvMap[tag] = val;
      offset += 2 + len;
    }

    return TdpDiscoveryResult.fromTlv(tlvMap, senderIp);
  }
}
