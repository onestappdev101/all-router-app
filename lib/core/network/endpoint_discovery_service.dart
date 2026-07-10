import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:onest_all_router_app/database/local/database.dart';

class EndpointDiscoveryService {
  Future<String> discover(String brandName) async {
    debugPrint('[EndpointDiscoveryService] Starting discovery for brand: "$brandName"');
    final brand = await AppDatabase.instance.brandsDao.getBrandByName(brandName);
    
    final List<String> hosts = [];
    if (brand != null && brand.dns != null && brand.dns!.isNotEmpty) {
      final cleanDns = brand.dns!
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll('"', '')
          .replaceAll("'", '');
      hosts.addAll(
        cleanDns
            .split(',')
            .map((h) => h.trim())
            .where((h) => h.isNotEmpty),
      );
    }
    
    debugPrint('[EndpointDiscoveryService] Resolved dns host domains to check: $hosts');

    final dio = Dio();
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        // Ignore self-signed SSL/TLS certificate errors commonly found on routers
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );

    for (final host in hosts) {
      final url = 'http://$host';
      debugPrint('[EndpointDiscoveryService] Sending GET request to: $url');
      try {
        final response = await dio.get(
          url,
          options: Options(
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
            headers: {
              'Authorization': 'Basic YWRtaW46YWRtaW4=', // Send dummy credentials (admin:admin) so Basic Auth routers respond instead of dropping the connection
            },
            validateStatus: (status) => true, // Accept any status code (302 redirects, 401 unauthorized, etc. mean the host is active)
          ),
        );
        debugPrint('[EndpointDiscoveryService] Received response from $url with code: ${response.statusCode}');
        if (response.statusCode != null) {
          debugPrint('[EndpointDiscoveryService] Host $host resolved and responded successfully. Selection: $host');
          return host;
        }
      } catch (e) {
        debugPrint('[EndpointDiscoveryService] Error requesting $url: $e');
        // If we get a response in the exception (e.g., bad response status), the host is alive
        if (e is DioException) {
          if (e.response != null) {
            debugPrint('[EndpointDiscoveryService] Exception has non-null response with code: ${e.response!.statusCode}. Marking host $host as active.');
            return host;
          } else {
            debugPrint('[EndpointDiscoveryService] DioException details: type=${e.type}, message=${e.message}');
          }
        }
      }
    }
    debugPrint('[EndpointDiscoveryService] All domains failed to respond.');
    throw Exception('No valid endpoint found in the provided hosts.');
  }
}