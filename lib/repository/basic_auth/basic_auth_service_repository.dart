import '../../service/basic_auth/router_status_service.dart';

class BasicAuthServiceRepository {
  final service = RouterStatusService(
    baseUrl: 'http://192.168.1.1',
    username: 'admin',
    password: 'admin',
  );
  late final staus=service.getStatus();
}