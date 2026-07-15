import 'package:flutter/material.dart';
import '../data/repository/check_connection_repository.dart';

class EstablishConnectionViewModel extends ChangeNotifier {
  final CheckConnectionRepository _repository = CheckConnectionRepository();

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Map<String, String?>? _networkInfo;
  Map<String, String?>? get networkInfo => _networkInfo;

  Future<void> checkConnection(String brandName) async {
    debugPrint('[EstablishConnectionViewModel] Initiating checkConnection for brand: "$brandName"...');
    _isLoading = true;
    _errorMessage = null;
    _networkInfo = null;
    notifyListeners();

    final startTime = DateTime.now();

    Map<String, String?>? result;
    try {
      result = await _repository.checkConnection(brandName);
      debugPrint('[EstablishConnectionViewModel] Repository check succeeded with result: $result');
    } catch (e) {
      final msg = e.toString();
      _errorMessage = msg.startsWith('Exception: ') ? msg.substring(11) : msg;
      debugPrint('[EstablishConnectionViewModel] Repository check failed with error: $_errorMessage');
    }

    final elapsedTime = DateTime.now().difference(startTime);
    final remainingDelay = const Duration(milliseconds: 1500) - elapsedTime;
    debugPrint('[EstablishConnectionViewModel] Elapsed time: ${elapsedTime.inMilliseconds}ms. Remaining delay: ${remainingDelay.inMilliseconds}ms');
    if (remainingDelay > Duration.zero) {
      await Future.delayed(remainingDelay);
    }

    _networkInfo = result;
    _isLoading = false;
    debugPrint('[EstablishConnectionViewModel] Connection check complete. isLoading: $_isLoading, hasError: ${_errorMessage != null}');
    notifyListeners();
  }
}
