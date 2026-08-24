import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:onest_all_router_app/core/network/tplink/tplink_crc32.dart';
import 'package:onest_all_router_app/core/network/tplink/tplink_tdp_discovery.dart';
import 'package:onest_all_router_app/core/network/tplink/tplink_tmp_client.dart';
import 'package:onest_all_router_app/data/models/tplink/tplink_models.dart';

void main() {
  group('TP-Link Protocol Tests', () {
    test('CRC32 computation with magic seed', () {
      final header = Uint8List(16);
      final bd = ByteData.sublistView(header);
      bd.setUint8(0, 0x01);
      bd.setUint8(1, 0x00);
      bd.setUint16(2, 0x0002, Endian.big);
      bd.setUint16(4, 0x0000, Endian.big);
      bd.setUint8(6, 0x11);
      bd.setUint8(7, 0x01);
      bd.setUint32(8, 1, Endian.big);
      bd.setUint32(12, TPLinkCrc32.magicCrcSeed, Endian.big);

      final crc = TPLinkCrc32.compute(header);
      expect(crc, isNot(0));
      expect(crc, isA<int>());
    });

    test('TDP Discovery Probe Packet Construction', () {
      final packet = TPLinkTdpDiscovery.buildDiscoveryPacket(sequenceNumber: 42);

      expect(packet.length, equals(16));
      final bd = ByteData.sublistView(packet);

      expect(bd.getUint8(0), equals(0x01)); // Version
      expect(bd.getUint8(1), equals(0x00)); // Type
      expect(bd.getUint16(2, Endian.big), equals(0x0002)); // Discovery Request
      expect(bd.getUint16(4, Endian.big), equals(0x0000)); // Payload len
      expect(bd.getUint8(6), equals(0x11)); // Opt 1
      expect(bd.getUint8(7), equals(0x01)); // Opt 2
      expect(bd.getUint32(8, Endian.big), equals(42)); // Sequence number
    });

    test('TDP Response TLV Parsing', () {
      // Build dummy TDP TLV payload
      final raw = <int>[
        0x01, 0x00, 0x00, 0x01, 0x00, 0x10, 0x11, 0x01,
        0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, // 16 bytes header
        1, 11, ...utf8.encode('192.168.0.1'), // Tag 1: IP
        2, 17, ...utf8.encode('AA-BB-CC-DD-EE-FF'), // Tag 2: MAC
        3, 10, ...utf8.encode('MyHomeWifi'), // Tag 3: SSID (10 chars)
        4, 9, ...utf8.encode('Archer C7'), // Tag 4: Model
      ];

      final result = TPLinkTdpDiscovery.parseDiscoveryResponse(Uint8List.fromList(raw), '192.168.0.1');

      expect(result, isNotNull);
      expect(result!.ip, equals('192.168.0.1'));
      expect(result.mac, equals('AA-BB-CC-DD-EE-FF'));
      expect(result.ssid, equals('MyHomeWifi'));
      expect(result.model, equals('Archer C7'));
    });

    test('TMP Packet Header Construction & Session Token Attachment', () {
      final client = TPLinkTmpClient(routerIp: '192.168.0.1');
      final payloadStr = jsonEncode({'username': 'admin', 'password': 'password123'});
      final payloadBytes = Uint8List.fromList(utf8.encode(payloadStr));

      final packet = client.buildPacket(
        msgId: 1,
        pktCmd: 5,
        payload: payloadBytes,
        overrideSessionId: 0x12345678,
        overrideSeqNum: 7,
      );

      expect(packet.length, equals(24 + payloadBytes.length));

      final bd = ByteData.sublistView(packet);
      expect(bd.getUint8(0), equals(1)); // Version
      expect(bd.getUint8(2), equals(5)); // Pkt Cmd (5 = Data)
      expect(bd.getUint16(4, Endian.big), equals(8 + payloadBytes.length)); // Payload len (sub-header + body)
      expect(bd.getUint8(6), equals(7)); // Seq num
      expect(bd.getUint32(8, Endian.big), equals(0x12345678)); // Session ID (Token)
      expect(bd.getUint8(16), equals(1)); // Major ver
      expect(bd.getUint16(18, Endian.big), equals(1)); // Msg ID (1 = Login)
      expect(bd.getUint8(20), equals(0)); // Direction (0 = Client request)

      final decodedPayload = utf8.decode(packet.sublist(24));
      expect(decodedPayload, equals(payloadStr));
    });

    test('Data Models Deserialization', () {
      final deviceInfoJson = {
        'error_code': 0,
        'device_info': {
          'device_model': 'Archer AX50',
          'hardware_version': 'v1.0',
          'firmware_version': '1.0.9 Build 20200708',
          'mac': '11:22:33:44:55:66',
          'cpu_usage': 25,
          'mem_usage': 50,
          'uptime': 3600,
        }
      };

      final info = TPLinkDeviceInfo.fromJson(deviceInfoJson);
      expect(info.model, equals('Archer AX50'));
      expect(info.hardwareVer, equals('v1.0'));
      expect(info.firmwareVer, equals('1.0.9 Build 20200708'));
      expect(info.mac, equals('11:22:33:44:55:66'));
      expect(info.cpuUsage, equals(25));
      expect(info.memUsage, equals(50));
      expect(info.uptime, equals(3600));

      final clientJson = {
        'mac': '99:88:77:66:55:44',
        'ip': '192.168.0.100',
        'hostname': 'Test-Phone',
        'conn_type': 'wifi_5g',
        'blocked': false,
        'up_speed': 1024,
        'down_speed': 2048,
      };

      final clientModel = TPLinkConnectedClient.fromJson(clientJson);
      expect(clientModel.mac, equals('99:88:77:66:55:44'));
      expect(clientModel.ip, equals('192.168.0.100'));
      expect(clientModel.hostname, equals('Test-Phone'));
      expect(clientModel.connType, equals('wifi_5g'));
      expect(clientModel.isBlocked, isFalse);
      expect(clientModel.upSpeed, equals(1024));
      expect(clientModel.downSpeed, equals(2048));
    });
  });
}
