class AuthResultModel {
  final bool authenticated;
  final String? token;
  final String? sessionCookie;
  final String method;
  final String? error;

  const AuthResultModel({
    required this.authenticated,
    this.token,
    this.sessionCookie,
    required this.method,
    this.error,
  });

  factory AuthResultModel.fromJson(Map<String, dynamic> json) {
    return AuthResultModel(
      authenticated: json['authenticated'] as bool? ?? false,
      token: json['token'] as String?,
      sessionCookie: json['sessionCookie'] as String?,
      method: json['method'] as String? ?? 'unknown',
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authenticated': authenticated,
      'token': token,
      'sessionCookie': sessionCookie,
      'method': method,
      'error': error,
    };
  }

  @override
  String toString() =>
      'AuthResultModel(authenticated: $authenticated, method: $method, token: $token)';
}
