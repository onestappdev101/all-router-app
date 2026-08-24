import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../data/repository/basic_auth/basic_auth_service_repository.dart';
import '../core/service/basic_auth/router_status_service.dart';
import '../core/network/auth/auth_strategy.dart';
import '../core/service/basic_auth/login/login_service_basic_auth.dart';
import '../core/service/digest_auth/login/login_service_digest_auth.dart';
import '../core/service/cookie_auth/login/login_service_cookie_auth.dart';
import '../core/service/token_auth/login/login_service_token_auth.dart';
import '../core/service/oauth_api_key/login/login_service_oauth_api_key.dart';
import '../core/service/tplink/login_service_tplink_tmp.dart';
import '../core/network/tplink/tplink_tmp_client.dart';
import '../core/network/tplink/tplink_tdp_discovery.dart';
import '../core/network/network_info.dart';
import '../core/network/router_info_detector.dart';
import '../data/models/tplink/tplink_models.dart';
import '../data/models/auth_result_model.dart';

class LoginViewmodel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  String? _sessionToken;
  String? get sessionToken => _sessionToken;

  RouterStatus? _routerStatus;
  RouterStatus? get routerStatus => _routerStatus;

  List<TPLinkConnectedClient> _connectedClients = [];
  List<TPLinkConnectedClient> get connectedClients => _connectedClients;

  TPLinkWifiSettings? _wifiSettings;
  TPLinkWifiSettings? get wifiSettings => _wifiSettings;

  TPLinkWanStatus? _wanStatus;
  TPLinkWanStatus? get wanStatus => _wanStatus;

  TPLinkDeviceInfo? _tplinkDeviceInfo;
  TPLinkDeviceInfo? get tplinkDeviceInfo => _tplinkDeviceInfo;

  BasicAuthServiceRepository? _repository;
  BasicAuthServiceRepository? get repository => _repository;

  Future<bool> login({
    required String username,
    required String password,
    String baseUrl = 'http://192.168.1.1',
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _sessionToken = null;
    _routerStatus = null;
    _connectedClients = [];
    _wifiSettings = null;
    _wanStatus = null;
    _tplinkDeviceInfo = null;
    notifyListeners();

    try {
      final dio = Dio();
      final List<AuthStrategy> strategies = [
        LoginServiceTPLinkTmp(),
        LoginServiceBasicAuth(),
        LoginServiceDigestAuth(),
        LoginServiceCookieAuth(),
        LoginServiceTokenAuth(),
        LoginServiceOAuthApiKey(),
      ];

      AuthResultModel? successResult;
      AuthStrategy? workingStrategy;

      for (final strategy in strategies) {
        debugPrint('[LoginViewmodel] Trying auth strategy: ${strategy.strategyName} against $baseUrl...');
        try {
          final result = await strategy.authenticate(dio, baseUrl, username, password);
          debugPrint('[LoginViewmodel] Strategy ${strategy.strategyName} result: authenticated=${result.authenticated}, error=${result.error}');
          if (result.authenticated) {
            successResult = result;
            workingStrategy = strategy;
            break;
          }
        } catch (e) {
          debugPrint('[LoginViewmodel] Strategy ${strategy.strategyName} threw exception: $e');
        }
      }

      if (successResult == null) {
        throw Exception('All authentication methods failed.');
      }

      debugPrint('[LoginViewmodel] Authentication successful using strategy: ${workingStrategy!.strategyName}');

      _sessionToken = successResult.token ?? successResult.sessionCookie;

      if (successResult.method == 'basic') {
        final repo = BasicAuthServiceRepository(
          baseUrl: baseUrl,
          username: username,
          password: password,
          dio: dio,
        );
        _repository = repo;
        try {
          _routerStatus = await repo.getStatus();
        } catch (e) {
          debugPrint('[LoginViewmodel] Status fetch failed for basic auth ($e), using fallback status model.');
          _routerStatus = RouterStatus(
            firmwareVersion: 'N/A',
            hardwareVersion: 'N/A',
            lanMac: 'N/A',
            lanIp: baseUrl,
            lanSubnetMask: 'N/A',
            ssid: 'N/A',
            wirelessMac: 'N/A',
            wanMac: 'N/A',
            wanIp: 'N/A',
            wanSubnetMask: 'N/A',
            defaultGateway: 'N/A',
            dnsServers: 'N/A',
            receivedBytes: '0',
            sentBytes: '0',
            receivedPackets: '0',
            sentPackets: '0',
          );
        }
      } else if (successResult.method == 'tplink_tmp') {
        final repo = BasicAuthServiceRepository(
          baseUrl: baseUrl,
          username: username,
          password: password,
          dio: dio,
        );
        _repository = repo;

        try {
          final targetIp = baseUrl.replaceAll(RegExp(r'^https?://'), '').split('/').first.split(':').first;
          final tmpClient = TPLinkTmpClient(routerIp: targetIp);
          final loggedIn = await tmpClient.connectAndLogin(username, password);
          if (loggedIn) {
            final devInfo = await tmpClient.fetchDeviceInfo();
            final wifiInfo = await tmpClient.fetchWifiSettings();
            final wanInfo = await tmpClient.fetchWanStatus();
            final clients = await tmpClient.fetchConnectedClients();
            await tmpClient.disconnect();

            _tplinkDeviceInfo = devInfo;
            _wifiSettings = wifiInfo;
            _wanStatus = wanInfo;
            _connectedClients = clients;

            _routerStatus = RouterStatus(
              firmwareVersion: devInfo?.firmwareVer ?? 'N/A',
              hardwareVersion: devInfo?.hardwareVer ?? 'N/A',
              lanMac: devInfo?.mac ?? 'N/A',
              lanIp: targetIp,
              lanSubnetMask: 'N/A',
              ssid: wifiInfo?.wifi2g?.ssid ?? wifiInfo?.wifi5g?.ssid ?? 'N/A',
              wirelessMac: devInfo?.mac ?? 'N/A',
              wanMac: devInfo?.mac ?? 'N/A',
              wanIp: wanInfo?.ip ?? 'N/A',
              wanSubnetMask: wanInfo?.mask ?? 'N/A',
              defaultGateway: wanInfo?.gateway ?? 'N/A',
              dnsServers: wanInfo?.dns ?? 'N/A',
              receivedBytes: '0',
              sentBytes: '0',
              receivedPackets: '0',
              sentPackets: '0',
            );
          }
        } catch (e) {
          debugPrint('[LoginViewmodel] Failed fetching TP-Link TMP info: $e');
        }

        _routerStatus ??= RouterStatus(
          firmwareVersion: 'N/A',
          hardwareVersion: 'N/A',
          lanMac: 'N/A',
          lanIp: baseUrl,
          lanSubnetMask: 'N/A',
          ssid: 'N/A',
          wirelessMac: 'N/A',
          wanMac: 'N/A',
          wanIp: 'N/A',
          wanSubnetMask: 'N/A',
          defaultGateway: 'N/A',
          dnsServers: 'N/A',
          receivedBytes: '0',
          sentBytes: '0',
          receivedPackets: '0',
          sentPackets: '0',
        );
      } else {
        final repo = BasicAuthServiceRepository(
          baseUrl: baseUrl,
          username: username,
          password: password,
          dio: dio,
        );
        _repository = repo;
        
        _routerStatus = RouterStatus(
          firmwareVersion: 'N/A',
          hardwareVersion: 'N/A',
          lanMac: 'N/A',
          lanIp: baseUrl,
          lanSubnetMask: 'N/A',
          ssid: 'N/A',
          wirelessMac: 'N/A',
          wanMac: 'N/A',
          wanIp: 'N/A',
          wanSubnetMask: 'N/A',
          defaultGateway: 'N/A',
          dnsServers: 'N/A',
          receivedBytes: '0',
          sentBytes: '0',
          receivedPackets: '0',
          sentPackets: '0',
        );
      }

      // Enrich with real live network data (Wi-Fi SSID, Router MAC, Public IP, TDP Model)
      await _enrichWithRealNetworkData(baseUrl, dio);

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

  /// Enriches router status with real live data from local Wi-Fi interface (network_info_plus),
  /// Public WAN IP lookup (ipify), and UDP TDP discovery probes.
  Future<void> _enrichWithRealNetworkData(String baseUrl, Dio dio) async {
    try {
      debugPrint('[LoginViewmodel] Enriching router status with live network queries...');

      // 1. Fetch real Wi-Fi SSID, Router BSSID (MAC), Gateway IP, and Subnet Mask
      final netInfo = await NetworkInfoHelper.fetchNetworkInfo();
      final wifiName = netInfo['wifiName']?.replaceAll('"', '').trim();
      final wifiBSSID = netInfo['wifiBSSID']?.trim();
      final wifiGateway = netInfo['wifiGateway']?.trim();
      final wifiSubmask = netInfo['wifiSubmask']?.trim();

      // 2. Fetch real Public WAN IP address via Public IP Lookup
      String? publicWanIp;
      try {
        final ipResponse = await dio.get<Map<String, dynamic>>(
          'https://api.ipify.org?format=json',
          options: Options(
            connectTimeout: const Duration(seconds: 3),
            receiveTimeout: const Duration(seconds: 3),
          ),
        );
        if (ipResponse.data != null && ipResponse.data!['ip'] != null) {
          publicWanIp = ipResponse.data!['ip'] as String;
          debugPrint('[LoginViewmodel] Resolved Public WAN IP: $publicWanIp');
        }
      } catch (e) {
        debugPrint('[LoginViewmodel] Public WAN IP lookup note: $e');
      }

      // 3. Perform TDP Discovery Probe to get TP-Link router model name if available
      String? tdpModel;
      String? tdpMac;
      String? tdpSsid;
      try {
        final discoveryResults = await TPLinkTdpDiscovery.discover(timeout: const Duration(seconds: 2));
        if (discoveryResults.isNotEmpty) {
          final res = discoveryResults.first;
          if (res.model != 'N/A' && res.model.isNotEmpty) tdpModel = res.model;
          if (res.mac != 'N/A' && res.mac.isNotEmpty) tdpMac = res.mac;
          if (res.ssid != 'N/A' && res.ssid.isNotEmpty) tdpSsid = res.ssid;
          debugPrint('[LoginViewmodel] Discovered router via TDP: $tdpModel ($tdpMac)');
        }
      } catch (e) {
        debugPrint('[LoginViewmodel] TDP probe note: $e');
      }

      // 4. Perform RouterInfoDetector probe to resolve exact model name, hardware version, firmware version, and vendor name
      final detected = await RouterInfoDetector.detect(
        baseUrl: baseUrl,
        dio: dio,
        wifiName: wifiName ?? tdpSsid,
        macAddress: wifiBSSID ?? tdpMac,
      );

      final existing = _routerStatus;
      final resolvedMac = (existing?.lanMac != null && existing!.lanMac != 'N/A')
          ? existing.lanMac
          : (wifiBSSID ?? tdpMac ?? 'N/A');
      final resolvedSsid = (existing?.ssid != null && existing!.ssid != 'N/A')
          ? existing.ssid
          : (wifiName ?? tdpSsid ?? detected.modelName);
      final resolvedWanIp = (existing?.wanIp != null && existing!.wanIp != 'N/A')
          ? existing.wanIp
          : (publicWanIp ?? 'N/A');
      final resolvedGateway = (existing?.defaultGateway != null && existing!.defaultGateway != 'N/A')
          ? existing.defaultGateway
          : (wifiGateway ?? baseUrl.replaceAll(RegExp(r'^https?://'), '').split('/').first.split(':').first);
      final resolvedSubmask = (existing?.lanSubnetMask != null && existing!.lanSubnetMask != 'N/A')
          ? existing.lanSubnetMask
          : (wifiSubmask ?? 'N/A');

      final resolvedHardware = (existing?.hardwareVersion != null && existing!.hardwareVersion != 'N/A')
          ? existing.hardwareVersion
          : (tdpModel ?? detected.hardwareVersion);
      final resolvedFirmware = (existing?.firmwareVersion != null && existing!.firmwareVersion != 'N/A')
          ? existing.firmwareVersion
          : detected.firmwareVersion;

      _routerStatus = RouterStatus(
        firmwareVersion: resolvedFirmware,
        hardwareVersion: resolvedHardware,
        lanMac: resolvedMac,
        lanIp: resolvedGateway,
        lanSubnetMask: resolvedSubmask,
        ssid: resolvedSsid,
        wirelessMac: resolvedMac,
        wanMac: resolvedMac,
        wanIp: resolvedWanIp,
        wanSubnetMask: resolvedSubmask,
        defaultGateway: resolvedGateway,
        dnsServers: (existing != null && existing.dnsServers != 'N/A' && existing.dnsServers.isNotEmpty) ? existing.dnsServers : 'N/A',
        receivedBytes: existing?.receivedBytes ?? '0',
        sentBytes: existing?.sentBytes ?? '0',
        receivedPackets: existing?.receivedPackets ?? '0',
        sentPackets: existing?.sentPackets ?? '0',
      );
    } catch (e) {
      debugPrint('[LoginViewmodel] Network data enrichment note: $e');
    }
  }
}