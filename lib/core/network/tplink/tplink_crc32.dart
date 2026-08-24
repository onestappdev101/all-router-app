import 'dart:typed_data';

/// Helper class for calculating CRC32 matching IEEE 802.3 specification
/// as required by TP-Link TDP and TMP protocols.
class TPLinkCrc32 {
  /// Magic constant seed required by TP-Link protocol: 1516993677 (0x5A6B7C8D)
  static const int magicCrcSeed = 0x5A6B7C8D; // 1516993677

  /// Calculates IEEE 802.3 standard CRC32 over [bytes].
  ///
  /// For TP-Link packet headers:
  /// Bytes 12..15 of the packet must be pre-filled with [magicCrcSeed] (big-endian)
  /// before calculating the CRC32 checksum over the entire packet header + payload.
  static int compute(Uint8List bytes) {
    int crc = 0xFFFFFFFF;
    for (final byte in bytes) {
      crc ^= byte;
      for (int i = 0; i < 8; i++) {
        if ((crc & 1) != 0) {
          crc = (crc >> 1) ^ 0xEDB88320;
        } else {
          crc >>= 1;
        }
      }
    }
    return (crc ^ 0xFFFFFFFF) & 0xFFFFFFFF;
  }
}
