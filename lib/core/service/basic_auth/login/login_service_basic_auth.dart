import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../data/models/auth_result_model.dart';
import '../../../constants/app_constants.dart';
import '../../../network/auth/auth_strategy.dart';

class LoginServiceBasicAuth implements AuthStrategy {
  @override
  String get strategyName => 'BasicAuth';

  @override
  Future<AuthResultModel> authenticate(
      Dio dio,
      String baseUrl,
      String username,
      String password,
      ) async {
    final encoded = base64Encode(utf8.encode('$username:$password'));

    try {
      final response = await dio.get<dynamic>(
        baseUrl,
        options: Options(
          headers: {'Authorization': 'Basic $encoded'},
          validateStatus: (s) => s != null && s < 600,
        ),
      );

      final status = response.statusCode ?? 0;
      final authenticated = status != 401 && status < 400;

      return AuthResultModel(
        authenticated: authenticated,
        token: authenticated ? encoded : null,
        method: AppConstants.authBasic,
        error: authenticated ? null : 'AUTH_FAILED: HTTP $status',
      );
    } on DioException catch (e) {
      return AuthResultModel(
        authenticated: false,
        method: AppConstants.authBasic,
        error: 'NETWORK_ERROR: ${e.message}',
      );
    } catch (e) {
      return AuthResultModel(
        authenticated: false,
        method: AppConstants.authBasic,
        error: 'UNKNOWN_ERROR: $e',
      );
    }
  }
}
