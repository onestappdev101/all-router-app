import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../data/models/auth_result_model.dart';
import '../../network/auth/auth_strategy.dart';
import '../../network/tplink/tplink_tdp_discovery.dart';
import '../../network/tplink/tplink_tmp_client.dart';

/// Authentication strategy for TP-Link Routers using direct local TDP UDP discovery
/// and TMP TCP 3-step handshake & login protocol on port 20002.
class LoginServiceTPLinkTmp implements AuthStrategy {
  @override
  String get strategyName => 'TP-Link TMP Local';

  @override
  Future<AuthResultModel> authenticate(
    Dio dio,
    String baseUrl,
    String username,
    String password,
  ) async {
    debugPrint('[LoginServiceTPLinkTmp] Attempting TP-Link local TMP login...');

    String targetIp = _extractHost(baseUrl);

    // If host is a domain (e.g., tplinkwifi.net) or generic, attempt UDP TDP discovery first
    if (!RegExp(r'^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$').hasMatch(targetIp)) {
      debugPrint('[LoginServiceTPLinkTmp] Target is domain/hostname ($targetIp). Running TDP Discovery probe...');
      try {
        final discoveryResults = await TPLinkTdpDiscovery.discover(timeout: const Duration(seconds: 2));
        if (discoveryResults.isNotEmpty) {
          targetIp = discoveryResults.first.ip;
          debugPrint('[LoginServiceTPLinkTmp] Resolved TP-Link router IP via TDP: $targetIp');
        }
      } catch (e) {
        debugPrint('[LoginServiceTPLinkTmp] TDP Discovery failed: $e');
      }
    }

    final client = TPLinkTmpClient(routerIp: targetIp);

    try {
      final success = await client.connectAndLogin(username, password);

      if (success) {
        final sessionId = client.sessionId.toString();
        debugPrint('[LoginServiceTPLinkTmp] Successfully authenticated with TP-Link router! Session ID: $sessionId');
        await client.disconnect();

        return AuthResultModel(
          authenticated: true,
          token: sessionId,
          method: 'tplink_tmp',
          error: null,
        );
      } else {
        await client.disconnect();
        return const AuthResultModel(
          authenticated: false,
          method: 'tplink_tmp',
          error: 'AUTH_FAILED: Invalid username/password or negotiation failure',
        );
      }
    } catch (e) {
      await client.disconnect();
      return AuthResultModel(
        authenticated: false,
        method: 'tplink_tmp',
        error: 'NETWORK_ERROR: $e',
      );
    }
  }

  String _extractHost(String url) {
    String clean = url.replaceAll(RegExp(r'^https?://'), '');
    if (clean.contains('/')) {
      clean = clean.split('/').first;
    }
    if (clean.contains(':')) {
      clean = clean.split(':').first;
    }
    return clean.isEmpty ? '192.168.0.1' : clean;
  }
}
