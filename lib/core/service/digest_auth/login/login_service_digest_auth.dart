import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import '../../../../data/models/auth_result_model.dart';
import '../../../constants/app_constants.dart';
import '../../../network/auth/auth_strategy.dart';

class LoginServiceDigestAuth implements AuthStrategy {
  @override
  String get strategyName => 'DigestAuth';

  @override
  Future<AuthResultModel> authenticate(
      Dio dio,
      String baseUrl,
      String username,
      String password,
      ) async {
    try {
      // Step 1: Send initial request to provoke a 401 Unauthorized response with WWW-Authenticate challenge
      final challengeResponse = await dio.get<dynamic>(
        baseUrl,
        options: Options(
          validateStatus: (s) => s != null && s < 600,
        ),
      );

      final challengeStatus = challengeResponse.statusCode ?? 0;
      if (challengeStatus != 401) {
        // If not 401, the server might already be authenticated or digest is not required
        final authenticated = challengeStatus >= 200 && challengeStatus < 400;
        return AuthResultModel(
          authenticated: authenticated,
          method: AppConstants.authDigest,
          error: authenticated ? null : 'DIGEST_CHALLENGE_FAILED: HTTP $challengeStatus',
        );
      }

      // Step 2: Extract and parse WWW-Authenticate header
      final authHeader = challengeResponse.headers.value('www-authenticate');
      if (authHeader == null || !authHeader.toLowerCase().contains('digest')) {
        return AuthResultModel(
          authenticated: false,
          method: AppConstants.authDigest,
          error: 'DIGEST_CHALLENGE_FAILED: No valid Digest challenge found in header',
        );
      }

      final params = _parseWwwAuthenticate(authHeader);
      
      // Step 3: Compute Digest credentials
      final String cnonce = _generateCnonce();
      const String nc = '00000001';
      const String uri = '/'; // standard root query for discovery/login check
      final String realm = params['realm'] ?? '';
      final String nonce = params['nonce'] ?? '';
      final String? qop = params['qop'];
      final String? opaque = params['opaque'];

      final String ha1 = _computeMd5('$username:$realm:$password');
      final String ha2 = _computeMd5('GET:$uri');

      String responseValue;
      if (qop != null && qop.split(',').map((q) => q.trim()).contains('auth')) {
        responseValue = _computeMd5('$ha1:$nonce:$nc:$cnonce:auth:$ha2');
      } else {
        responseValue = _computeMd5('$ha1:$nonce:$ha2');
      }

      final List<String> authHeaderParts = [
        'Digest username="$username"',
        'realm="$realm"',
        'nonce="$nonce"',
        'uri="$uri"',
        'response="$responseValue"',
      ];

      if (opaque != null) {
        authHeaderParts.add('opaque="$opaque"');
      }
      if (qop != null && qop.split(',').map((q) => q.trim()).contains('auth')) {
        authHeaderParts.add('qop="auth"');
        authHeaderParts.add('nc=$nc');
        authHeaderParts.add('cnonce="$cnonce"');
      }

      final String authorizationHeader = authHeaderParts.join(', ');

      // Step 4: Perform the authenticated request using computed digest header
      final response = await dio.get<dynamic>(
        baseUrl,
        options: Options(
          headers: {'Authorization': authorizationHeader},
          validateStatus: (s) => s != null && s < 600,
        ),
      );

      final status = response.statusCode ?? 0;
      final authenticated = status >= 200 && status < 400;

      return AuthResultModel(
        authenticated: authenticated,
        token: authenticated ? authorizationHeader : null,
        method: AppConstants.authDigest,
        error: authenticated ? null : 'AUTH_FAILED: HTTP $status',
      );
    } on DioException catch (e) {
      return AuthResultModel(
        authenticated: false,
        method: AppConstants.authDigest,
        error: 'NETWORK_ERROR: ${e.message}',
      );
    } catch (e) {
      return AuthResultModel(
        authenticated: false,
        method: AppConstants.authDigest,
        error: 'UNKNOWN_ERROR: $e',
      );
    }
  }

  Map<String, String> _parseWwwAuthenticate(String header) {
    final Map<String, String> params = {};
    // Regex matches parameters like key="value" or key=value
    final regex = RegExp(r'(\w+)\s*=\s*(?:"([^"]*)"|([^,\s]*))');
    final matches = regex.allMatches(header);
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2) ?? match.group(3);
      if (key != null && value != null) {
        params[key.toLowerCase()] = value;
      }
    }
    return params;
  }

  String _computeMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  String _generateCnonce() {
    final random = Random();
    final bytes = List<int>.generate(8, (_) => random.nextInt(256));
    return base64Url.encode(bytes).substring(0, 8);
  }
}
