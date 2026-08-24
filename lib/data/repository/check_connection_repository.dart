import 'package:flutter/foundation.dart';
import '../../core/network/endpoint_discovery_service.dart';
import '../../core/network/network_info.dart';

class CheckConnectionRepository {
  Future<Map<String, String?>> checkConnection(String brandName) async {
    debugPrint('[CheckConnectionRepository] starting connection check process...');
    // 1. Check EndpointDiscoveryService for a valid active endpoint first
    String activeHost;
    try {
      final discoveryService = EndpointDiscoveryService();
      activeHost = await discoveryService.discover(brandName);
      debugPrint('[CheckConnectionRepository] Active host discovered: "$activeHost"');
    } catch (e) {
      debugPrint('[CheckConnectionRepository] Endpoint discovery failed: $e');
      throw Exception("No valid endpoint found. Please check your connection and retry.");
    }

    // 2. On success, retrieve other network parameters using network_info_plus
    debugPrint('[CheckConnectionRepository] Discover succeeded. Fetching network details via network_info_plus...');
    Map<String, String?>? infoResult;
    try {
      infoResult = await NetworkInfoHelper.fetchNetworkInfo().timeout(const Duration(seconds: 1));
      debugPrint('[CheckConnectionRepository] Fetch network info raw result: $infoResult');
    } catch (e) {
      debugPrint("[CheckConnectionRepository] Fetch network info timed out or failed: $e");
    }

    final String cleanSsid = _cleanWifiName(infoResult?['wifiName']);
    final result = {
      'wifiName': (cleanSsid == 'N/A' || cleanSsid.isEmpty)
          ? 'N/A'
          : cleanSsid,
      'wifiBSSID': infoResult?['wifiBSSID'] ?? 'N/A',
      'wifiIP': infoResult?['wifiIP'] ?? 'N/A',
      'wifiIPv6': infoResult?['wifiIPv6'] ?? 'N/A',
      'wifiSubmask': infoResult?['wifiSubmask'] ?? 'N/A',
      'wifiBroadcast': infoResult?['wifiBroadcast'] ?? 'N/A',
      'wifiGateway': activeHost,
    };
    debugPrint('[CheckConnectionRepository] Final mapped connection payload: $result');
    return result;
  }

  String _cleanWifiName(String? name) {
    if (name == null || name.isEmpty) return 'N/A';
    if (name.startsWith('"') && name.endsWith('"')) {
      return name.substring(1, name.length - 1);
    }
    return name;
  }
}
