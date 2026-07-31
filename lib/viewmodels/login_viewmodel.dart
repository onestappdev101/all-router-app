import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../data/repository/basic_auth/basic_auth_service_repository.dart';
import '../core/service/basic_auth/router_status_service.dart';
import '../core/network/auth/auth_strategy.dart';
import '../core/service/basic_auth/login/login_service_basic_auth.dart';
import '../core/service/digest_auth/login/login_service_digest_auth.dart';
import '../core/service/cookie_auth/login/login_service_cookie_auth.dart';
import '../core/service/token_auth/login/login_service_token_auth.dart';
import '../core/service/oauth_api_key/login/login_service_oauth_api_key.dart';
import '../data/models/auth_result_model.dart';

class LoginViewmodel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _sessionToken;
  String? get sessionToken => _sessionToken;

  RouterStatus? _routerStatus;
  RouterStatus? get routerStatus => _routerStatus;

  BasicAuthServiceRepository? _repository;
  BasicAuthServiceRepository? get repository => _repository;

  Future<bool> login({
    required String username,
    required String password,
    String baseUrl = 'http://192.168.1.1',
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _sessionToken = null;
    _routerStatus = null;
    notifyListeners();

    try {
      final dio = Dio();
      final List<AuthStrategy> strategies = [
        LoginServiceBasicAuth(),
        LoginServiceDigestAuth(),
        LoginServiceCookieAuth(),
        LoginServiceTokenAuth(),
        LoginServiceOAuthApiKey(),
      ];

      AuthResultModel? successResult;
      AuthStrategy? workingStrategy;

      for (final strategy in strategies) {
        debugPrint('[LoginViewmodel] Trying auth strategy: ${strategy.strategyName} against $baseUrl...');
        try {
          final result = await strategy.authenticate(dio, baseUrl, username, password);
          debugPrint('[LoginViewmodel] Strategy ${strategy.strategyName} result: authenticated=${result.authenticated}, error=${result.error}');
          if (result.authenticated) {
            successResult = result;
            workingStrategy = strategy;
            break;
          }
        } catch (e) {
          debugPrint('[LoginViewmodel] Strategy ${strategy.strategyName} threw exception: $e');
        }
      }

      if (successResult == null) {
        throw Exception('All authentication methods failed.');
      }

      debugPrint('[LoginViewmodel] Authentication successful using strategy: ${workingStrategy!.strategyName}');

      _sessionToken = successResult.token ?? successResult.sessionCookie;

      if (successResult.method == 'basic') {
        final repo = BasicAuthServiceRepository(
          baseUrl: baseUrl,
          username: username,
          password: password,
          dio: dio,
        );
        _repository = repo;
        _routerStatus = await repo.fetchStatus(successResult.token ?? '');
      } else {
        final repo = BasicAuthServiceRepository(
          baseUrl: baseUrl,
          username: username,
          password: password,
          dio: dio,
        );
        _repository = repo;
        
        // Mock status response for unsupported / other routers
        _routerStatus = RouterStatus(
          firmwareVersion: 'Generic (${successResult.method})',
          hardwareVersion: 'Generic Hardware',
          lanMac: '00:00:00:00:00:00',
          lanIp: baseUrl,
          lanSubnetMask: '255.255.255.0',
          ssid: 'Router Management',
          wirelessMac: '00:00:00:00:00:00',
          wanMac: '00:00:00:00:00:00',
          wanIp: '0.0.0.0',
          wanSubnetMask: '255.255.255.0',
          defaultGateway: '0.0.0.0',
          dnsServers: '8.8.8.8',
          receivedBytes: '0',
          sentBytes: '0',
          receivedPackets: '0',
          sentPackets: '0',
        );
      }

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      if (e is RouterLoginException) {
        _errorMessage = e.message;
      } else {
        _errorMessage = e.toString();
      }
      notifyListeners();
      return false;
    }
  }
}