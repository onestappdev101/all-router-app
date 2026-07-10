import 'package:dio/dio.dart';

import '../../../data/models/auth_result_model.dart';

/// Abstract contract for an authentication strategy.
///
/// Each implementation encapsulates a specific HTTP authentication mechanism
/// (Basic, Digest, Cookie-based, Bearer token, etc.) and exposes a single
/// [authenticate] method.
abstract class AuthStrategy {
  /// Human-readable name identifying this strategy.
  String get strategyName;

  /// Attempts to authenticate against the router at [baseUrl] using the
  /// supplied [username] and [password] via the given [dio] instance.
  ///
  /// Returns an [AuthResultModel] describing the outcome. Never throws;
  /// exceptions are caught and reflected in the model's [AuthResultModel.error]
  /// field instead.
  Future<AuthResultModel> authenticate(
      Dio dio,
      String baseUrl,
      String username,
      String password,
      );
}
