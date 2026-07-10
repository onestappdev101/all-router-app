import 'package:network_info_plus/network_info_plus.dart';

class NetworkInfoHelper {
  static Future<Map<String, String?>> fetchNetworkInfo() async {
    final info = NetworkInfo();
    final wifiName = await info.getWifiName();
    final wifiBSSID = await info.getWifiBSSID();
    final wifiIP = await info.getWifiIP();
    final wifiIPv6 = await info.getWifiIPv6();
    final wifiSubmask = await info.getWifiSubmask();
    final wifiBroadcast = await info.getWifiBroadcast();
    final wifiGateway = await info.getWifiGatewayIP();

    return {
      'wifiName': wifiName,
      'wifiBSSID': wifiBSSID,
      'wifiIP': wifiIP,
      'wifiIPv6': wifiIPv6,
      'wifiSubmask': wifiSubmask,
      'wifiBroadcast': wifiBroadcast,
      'wifiGateway': wifiGateway,
    };
  }
}
