import 'package:dio/dio.dart';

import '../../../core/service/basic_auth/router_status_service.dart';


class BasicAuthServiceRepository {
  final RouterStatusService service;

  BasicAuthServiceRepository({
    String baseUrl = 'http://192.168.1.1',
    String username = 'admin',
    String password = 'admin',
    Dio? dio,
  }) : service = RouterStatusService(
          baseUrl: baseUrl,
          username: username,
          password: password,
          dio: dio,
        );

  // Maintain spelling 'staus' for backwards compatibility
  late final staus = service.getStatus();

  Future<String> login() => service.login();

  Future<RouterStatus> fetchStatus(String sessionToken) => service.fetchStatus(sessionToken);

  Future<RouterStatus> getStatus() => service.getStatus();
}