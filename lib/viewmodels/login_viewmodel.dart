import 'package:flutter/material.dart';
import '../data/repository/basic_auth/basic_auth_service_repository.dart';
import '../core/service/basic_auth/router_status_service.dart';

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
    notifyListeners();

    try {
      final repo = BasicAuthServiceRepository(
        baseUrl: baseUrl,
        username: username,
        password: password,
      );
      
      // Attempt login to fetch session token
      final token = await repo.login();
      _sessionToken = token;
      _repository = repo;

      // Optionally fetch status immediately to confirm session validity
      _routerStatus = await repo.fetchStatus(token);

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