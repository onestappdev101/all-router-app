import 'package:dio/dio.dart';
import '../../../../data/models/auth_result_model.dart';
import '../../../constants/app_constants.dart';
import '../../../network/auth/auth_strategy.dart';

class LoginServiceOAuthApiKey implements AuthStrategy {
  @override
  String get strategyName => 'OAuthApiKey';

  @override
  Future<AuthResultModel> authenticate(
      Dio dio,
      String baseUrl,
      String username,
      String password,
      ) async {
    // We try to support:
    // A. OAuth 2.0 Client Credentials Flow (treating username as client_id and password as client_secret)
    // B. Direct API Key authentication (treating password as the API Key, sending it in X-API-Key header)

    final List<String> oauthEndpoints = [
      '$baseUrl/oauth/token',
      '$baseUrl/oauth2/token',
      '$baseUrl/token',
    ];

    DioException? lastDioException;

    // --- Type A: Try OAuth 2.0 Client Credentials Exchange ---
    for (final url in oauthEndpoints) {
      try {
        final response = await dio.post<dynamic>(
          url,
          data: {
            'grant_type': 'client_credentials',
            'client_id': username,
            'client_secret': password,
          },
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
            validateStatus: (s) => s != null && s < 600,
          ),
        );

        final status = response.statusCode ?? 0;
        if (status >= 200 && status < 300 && response.data is Map) {
          final dataMap = response.data as Map;
          final token = dataMap['access_token'] ?? dataMap['token'];
          if (token != null) {
            return AuthResultModel(
              authenticated: true,
              token: token.toString(),
              method: AppConstants.authOAuthApiKey,
            );
          }
        }
      } on DioException catch (e) {
        lastDioException = e;
      } catch (e) {
        // Keep looking
      }
    }

    // --- Type B: Try Direct API Key Verification ---
    // If OAuth failed or was not found, treat 'password' as a raw API Key.
    // Try to access the base endpoint with the key in X-API-Key or apikey headers.
    final List<Map<String, String>> apiKeyHeaderOptions = [
      {'X-API-Key': password},
      {'Authorization': 'ApiKey $password'},
      {'apikey': password},
    ];

    for (final headers in apiKeyHeaderOptions) {
      try {
        final response = await dio.get<dynamic>(
          baseUrl,
          options: Options(
            headers: headers,
            validateStatus: (s) => s != null && s < 600,
          ),
        );

        final status = response.statusCode ?? 0;
        final authenticated = status >= 200 && status < 400;
        if (authenticated) {
          // Store the successful header choice as token for downstream calls
          return AuthResultModel(
            authenticated: true,
            token: password,
            method: AppConstants.authOAuthApiKey,
          );
        }
      } on DioException catch (e) {
        lastDioException = e;
      } catch (e) {
        // Try next option
      }
    }

    return AuthResultModel(
      authenticated: false,
      method: AppConstants.authOAuthApiKey,
      error: lastDioException != null 
          ? 'OAUTH_API_KEY_FAILED: ${lastDioException.message}' 
          : 'OAUTH_API_KEY_FAILED: Verification unsuccessful',
    );
  }
}
