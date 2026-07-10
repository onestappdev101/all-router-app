abstract final class AppConstants {
  // Network
  static const String defaultBaseUrl = 'http://192.168.1.1';
  static const int connectionTimeoutSeconds = 30;
  static const int receiveTimeoutSeconds = 15;
  static const int scanTimeoutMs = 1200;
  static const int gatewayCheckTimeoutMs = 2000;
  static const int maxAuthAttempts = 3;
  static const int subnetScanBatchSize = 20;

  // Known router ports to probe during discovery
  static const List<int> routerPorts = [80, 443, 8080, 8443];

  // Known router hostnames / IPs to try as fallback
  static const List<String> knownHostnames = [
    '192.168.0.1',
    '192.168.1.1',
    '10.0.0.1',
    '10.0.1.1',
    '172.16.0.1',
    'tplinkwifi.net',
    'routerlogin.net',
    'myfritz.box',
    'dlinkrouter.local',
  ];

  // Local storage keys
  static const String keyFingerprintPrefix = 'fp_';
  static const String keyLastRouterIp = 'last_router_ip';
  static const String keyOnboardingDone = 'onboarding_done';
  static const String keySetupDone = 'setup_done';

  // Secure storage key prefix
  static const String secureCredPrefix = 'routerhub_cred_';
  static const String credKeyPrefix = secureCredPrefix;
  static const String fingerprintKeyPrefix = keyFingerprintPrefix;

  // Brands
  static const String brandTpLink = 'tp-link';
  static const String brandHuawei = 'huawei';
  static const String brandAsus = 'asus';
  static const String brandOpenwrt = 'openwrt';
  static const String brandMikrotik = 'mikrotik';
  static const String brandNetgear = 'netgear';
  static const String brandUnknown = 'unknown';

  // Driver names
  static const String driverTPLinkOld = 'TPLinkOldDriver';
  static const String driverTPLinkAX = 'TPLinkAXDriver';
  static const String driverAsus = 'AsusDriver';
  static const String driverHuawei = 'HuaweiDriver';
  static const String driverOpenWrt = 'OpenWrtDriver';
  static const String driverGeneric = 'GenericDriver';

  // Confidence levels
  static const String confidenceHigh = 'high';
  static const String confidenceMedium = 'medium';
  static const String confidenceLow = 'low';
  static const String confidenceNone = 'none';

  // Auth methods
  static const String authBasic = 'basic';
  static const String authDigest = 'digest';
  static const String authCookie = 'cookie';
  static const String authBearer = 'bearer';

  // Discovery methods
  static const String methodDirectGateway = 'direct_gateway';
  static const String methodSubnetScan = 'subnet_scan';
  static const String methodKnownHost = 'known_host';

  // Error codes
  static const String errNoRouterFound = 'NO_ROUTER_FOUND';
  static const String errConnectionTimeout = 'CONNECTION_TIMEOUT';
  static const String errUnreachable = 'UNREACHABLE';
  static const String errFingerprintFailed = 'FINGERPRINT_FAILED';
  static const String errNoMatchingDriver = 'NO_MATCHING_DRIVER';
  static const String errAuthFailed = 'AUTH_FAILED';
  static const String errAuthLocked = 'AUTH_LOCKED';
  static const String errAuthTimeout = 'AUTH_TIMEOUT';
  static const String errSessionExpired = 'SESSION_EXPIRED';
  static const String errSessionExpiredNoCreds = 'SESSION_EXPIRED_NO_CREDENTIALS';

  // Phase names (for fallback display)
  static const Map<String, String> phaseNames = {
    errNoRouterFound: 'Phase 1 — Network Discovery',
    errConnectionTimeout: 'Phase 2 — Router Detection',
    errUnreachable: 'Phase 2 — Router Detection',
    errFingerprintFailed: 'Phase 3 — Fingerprinting',
    errNoMatchingDriver: 'Phase 4 — Driver Selection',
    errAuthFailed: 'Phase 5 — Authentication',
    errAuthLocked: 'Phase 5 — Authentication',
    errAuthTimeout: 'Phase 5 — Authentication',
    errSessionExpired: 'Phase 6 — Session Management',
    errSessionExpiredNoCreds: 'Phase 6 — Session Management',
  };
}
