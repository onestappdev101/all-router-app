import 'package:dio/dio.dart';

class EndpointDiscoveryService {
  Future<String> discover(List<String> hosts) async {
    for (final host in hosts) {
      try {
        final response = await Dio().get(
            'http://$host'
        );
        if (response.statusCode == 200) {
          return host;
        }
      } catch (e) {
        // Ignore errors and continue to the next host
      }
    }
    throw Exception('No valid endpoint found in the provided hosts.');
  }
}