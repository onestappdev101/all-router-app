import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DetectedRouterDetails {
  final String modelName;
  final String hardwareVersion;
  final String firmwareVersion;
  final String vendorName;

  const DetectedRouterDetails({
    required this.modelName,
    required this.hardwareVersion,
    required this.firmwareVersion,
    required this.vendorName,
  });
}

class RouterInfoDetector {
  /// Detects real router model, hardware version, firmware version, and vendor
  /// by inspecting HTTP web interface headers/titles, Wi-Fi SSID patterns, and MAC OUI lookups.
  static Future<DetectedRouterDetails> detect({
    required String baseUrl,
    required Dio dio,
    String? wifiName,
    String? macAddress,
  }) async {
    String model = '';
    String firmware = '';
    String hardware = '';
    String vendor = '';

    // 1. Try parsing Wi-Fi SSID for known router model patterns (e.g. TP-Link_Archer_C7, Deco_X20)
    if (wifiName != null && wifiName.isNotEmpty && wifiName != 'N/A') {
      final modelRegex = RegExp(r'(Archer\s*[A-Z0-9]+|Deco\s*[A-Z0-9]+|TL-WR\d+[A-Z]*|TL-WA\d+[A-Z]*|TL-MR\d+[A-Z]*)', caseSensitive: false);
      final match = modelRegex.firstMatch(wifiName);
      if (match != null) {
        model = match.group(0)!;
      }
    }

    // 2. Query HTTP web interface root for HTML title, Server header, and JS variables
    try {
      final response = await dio.get<String>(
        baseUrl,
        options: Options(
          followRedirects: true,
          validateStatus: (status) => status != null && status < 500,
          connectTimeout: const Duration(seconds: 3),
          receiveTimeout: const Duration(seconds: 3),
        ),
      );

      final serverHeader = response.headers.value('server') ?? '';
      if (serverHeader.isNotEmpty && !serverHeader.toLowerCase().contains('nginx') && !serverHeader.toLowerCase().contains('apache')) {
        if (model.isEmpty) model = serverHeader;
      }

      final body = response.data ?? '';
      if (body.isNotEmpty) {
        final titleMatch = RegExp(r'<title>(.*?)</title>', caseSensitive: false).firstMatch(body);
        if (titleMatch != null) {
          final title = titleMatch.group(1)!.trim();
          if (title.isNotEmpty && !title.toLowerCase().contains('404') && !title.toLowerCase().contains('error')) {
            if (model.isEmpty) model = title;
          }
        }

        String extractJsVar(String input, List<String> varNames) {
          for (final name in varNames) {
            final pattern = RegExp('$name\\s*=\\s*["\']([^"\']+)["\']', caseSensitive: false);
            final m = pattern.firstMatch(input);
            if (m != null && m.group(1) != null && m.group(1)!.isNotEmpty) {
              return m.group(1)!;
            }
          }
          return '';
        }

        final jsModel = extractJsVar(body, ['model', 'device_model', 'product_name']);
        if (jsModel.isNotEmpty) model = jsModel;

        final jsFw = extractJsVar(body, ['firmware', 'fw_ver', 'firmware_version', 'soft_version']);
        if (jsFw.isNotEmpty) firmware = jsFw;

        final jsHw = extractJsVar(body, ['hardware', 'hw_ver', 'hardware_version']);
        if (jsHw.isNotEmpty) hardware = jsHw;
      }
    } catch (e) {
      debugPrint('[RouterInfoDetector] Web interface probe note: $e');
    }

    // 3. Query MAC address OUI vendor if MAC is valid
    if (macAddress != null && macAddress.isNotEmpty && macAddress != 'N/A' && macAddress != '00:00:00:00:00:00') {
      try {
        final cleanMac = macAddress.replaceAll('-', ':').toUpperCase();
        final oui = cleanMac.split(':').take(3).join('');
        final ouiResp = await dio.get<String>(
          'https://api.macvendors.com/$oui',
          options: Options(
            connectTimeout: const Duration(seconds: 3),
            receiveTimeout: const Duration(seconds: 3),
          ),
        );
        if (ouiResp.data != null && ouiResp.data!.trim().isNotEmpty) {
          vendor = ouiResp.data!.trim();
          debugPrint('[RouterInfoDetector] Resolved OUI Vendor: $vendor');
        }
      } catch (e) {
        debugPrint('[RouterInfoDetector] OUI vendor lookup note: $e');
      }
    }

    // Return N/A when values could not be detected
    return DetectedRouterDetails(
      modelName: model.isNotEmpty
          ? model
          : (wifiName != null && wifiName.isNotEmpty && wifiName != 'N/A' ? wifiName : 'N/A'),
      hardwareVersion: hardware.isNotEmpty ? hardware : 'N/A',
      firmwareVersion: firmware.isNotEmpty ? firmware : 'N/A',
      vendorName: vendor.isNotEmpty ? vendor : 'N/A',
    );
  }
}
