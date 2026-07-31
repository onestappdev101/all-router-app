import 'package:dio/dio.dart';
import '../../../../data/models/auth_result_model.dart';
import '../../../constants/app_constants.dart';
import '../../../network/auth/auth_strategy.dart';

class LoginServiceCookieAuth implements AuthStrategy {
  @override
  String get strategyName => 'CookieAuth';

  @override
  Future<AuthResultModel> authenticate(
      Dio dio,
      String baseUrl,
      String username,
      String password,
      ) async {
    final List<String> endpointsToTry = [
      '$baseUrl/cgi-bin/login',
      '$baseUrl/api/login',
      '$baseUrl/login.cgi',
      baseUrl,
    ];

    DioException? lastDioException;

    for (final url in endpointsToTry) {
      try {
        // Try JSON POST first
        Response<dynamic> response = await dio.post<dynamic>(
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

        // If JSON POST failed/unsupported, try Form URLencoded
        if (response.statusCode == 415 || response.statusCode == 404 || response.statusCode == 405) {
          response = await dio.post<dynamic>(
            url,
            data: {
              'username': username,
              'password': password,
            },
            options: Options(
              contentType: Headers.formUrlEncodedContentType,
              validateStatus: (s) => s != null && s < 600,
            ),
          );
        }

        final status = response.statusCode ?? 0;
        final authenticated = status >= 200 && status < 300;

        if (authenticated) {
          final cookies = response.headers['set-cookie'];
          String? sessionCookie;
          if (cookies != null && cookies.isNotEmpty) {
            // Join all cookies returned (e.g. SessionID=abc; Path=/; HttpOnly)
            sessionCookie = cookies.join('; ');
          }

          // If no set-cookie header was returned, check body for a token/session parameter to use as cookie
          if (sessionCookie == null && response.data is Map) {
            final dataMap = response.data as Map;
            final sessionId = dataMap['sessionId'] ?? dataMap['session_id'] ?? dataMap['token'];
            if (sessionId != null) {
              sessionCookie = 'SessionID=$sessionId';
            }
          }

          return AuthResultModel(
            authenticated: true,
            sessionCookie: sessionCookie,
            method: AppConstants.authCookie,
          );
        }
      } on DioException catch (e) {
        lastDioException = e;
        // Continue loop to try other endpoints
      } catch (e) {
        // Continue loop to try other endpoints
      }
    }

    return AuthResultModel(
      authenticated: false,
      method: AppConstants.authCookie,
      error: lastDioException != null 
          ? 'COOKIE_AUTH_FAILED: ${lastDioException.message}' 
          : 'COOKIE_AUTH_FAILED: Unable to login on any standard endpoint',
    );
  }
}
