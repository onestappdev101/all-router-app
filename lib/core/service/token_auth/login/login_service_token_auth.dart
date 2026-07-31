import 'package:dio/dio.dart';
import '../../../../data/models/auth_result_model.dart';
import '../../../constants/app_constants.dart';
import '../../../network/auth/auth_strategy.dart';

class LoginServiceTokenAuth implements AuthStrategy {
  @override
  String get strategyName => 'TokenAuth';

  @override
  Future<AuthResultModel> authenticate(
      Dio dio,
      String baseUrl,
      String username,
      String password,
      ) async {
    final List<String> endpointsToTry = [
      '$baseUrl/api/v1/auth',
      '$baseUrl/api/auth/login',
      '$baseUrl/api/login',
      baseUrl,
    ];

    DioException? lastDioException;

    for (final url in endpointsToTry) {
      try {
        final response = await dio.post<dynamic>(
          url,
          data: {
            'username': username,
            'password': password,
          },
          options: Options(
            contentType: Headers.jsonContentType,
            validateStatus: (s) => s != null && s < 600,
          ),
        );

        final status = response.statusCode ?? 0;
        final authenticated = status >= 200 && status < 300;

        if (authenticated && response.data is Map) {
          final dataMap = response.data as Map;
          
          // Look for common token key names
          final token = dataMap['token'] ?? 
                        dataMap['access_token'] ?? 
                        dataMap['accessToken'] ?? 
                        dataMap['jwt'] ??
                        dataMap['data']?['token'];

          if (token != null) {
            return AuthResultModel(
              authenticated: true,
              token: token.toString(),
              method: AppConstants.authBearer,
            );
          }
        }
      } on DioException catch (e) {
        lastDioException = e;
      } catch (e) {
        // Ignore and try next endpoint
      }
    }

    return AuthResultModel(
      authenticated: false,
      method: AppConstants.authBearer,
      error: lastDioException != null 
          ? 'TOKEN_AUTH_FAILED: ${lastDioException.message}' 
          : 'TOKEN_AUTH_FAILED: No token found in response',
    );
  }
}
