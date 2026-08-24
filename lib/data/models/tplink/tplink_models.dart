// Data models representing TP-Link router responses from TDP discovery and TMP data queries.

/// Discovery result returned by TDP (TP-Link Discovery Protocol) over UDP 20002.
class TdpDiscoveryResult {
  final String ip;
  final String mac;
  final String ssid;
  final String model;
  final String hostname;
  final String subnetMask;

  const TdpDiscoveryResult({
    required this.ip,
    required this.mac,
    required this.ssid,
    required this.model,
    required this.hostname,
    required this.subnetMask,
  });

  factory TdpDiscoveryResult.fromTlv(Map<int, String> tlvMap, String senderIp) {
    return TdpDiscoveryResult(
      ip: (tlvMap[1] != null && tlvMap[1]!.isNotEmpty) ? tlvMap[1]! : senderIp,
      mac: (tlvMap[2] != null && tlvMap[2]!.isNotEmpty) ? tlvMap[2]! : 'N/A',
      ssid: (tlvMap[3] != null && tlvMap[3]!.isNotEmpty) ? tlvMap[3]! : 'N/A',
      model: (tlvMap[4] != null && tlvMap[4]!.isNotEmpty) ? tlvMap[4]! : 'N/A',
      hostname: (tlvMap[5] != null && tlvMap[5]!.isNotEmpty) ? tlvMap[5]! : 'N/A',
      subnetMask: (tlvMap[6] != null && tlvMap[6]!.isNotEmpty) ? tlvMap[6]! : 'N/A',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ip': ip,
      'mac': mac,
      'ssid': ssid,
      'model': model,
      'hostname': hostname,
      'subnetMask': subnetMask,
    };
  }

  @override
  String toString() =>
      'TdpDiscoveryResult(ip: $ip, model: $model, mac: $mac, ssid: $ssid)';
}

/// System and device information returned by Msg ID 1024.
class TPLinkDeviceInfo {
  final String model;
  final String hardwareVer;
  final String firmwareVer;
  final String mac;
  final int cpuUsage;
  final int memUsage;
  final int uptime;

  const TPLinkDeviceInfo({
    required this.model,
    required this.hardwareVer,
    required this.firmwareVer,
    required this.mac,
    required this.cpuUsage,
    required this.memUsage,
    required this.uptime,
  });

  factory TPLinkDeviceInfo.fromJson(Map<String, dynamic> json) {
    final info = json['device_info'] ?? json['result'] ?? json;
    return TPLinkDeviceInfo(
      model: (info['device_model'] as String?)?.isNotEmpty == true ? info['device_model'] as String : 'N/A',
      hardwareVer: (info['hardware_version'] as String?)?.isNotEmpty == true ? info['hardware_version'] as String : 'N/A',
      firmwareVer: (info['firmware_version'] as String?)?.isNotEmpty == true ? info['firmware_version'] as String : 'N/A',
      mac: (info['mac'] as String?)?.isNotEmpty == true ? info['mac'] as String : 'N/A',
      cpuUsage: (info['cpu_usage'] as num?)?.toInt() ?? 0,
      memUsage: (info['mem_usage'] as num?)?.toInt() ?? 0,
      uptime: (info['uptime'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'model': model,
      'hardwareVer': hardwareVer,
      'firmwareVer': firmwareVer,
      'mac': mac,
      'cpuUsage': cpuUsage,
      'memUsage': memUsage,
      'uptime': uptime,
    };
  }
}

/// Connected device (client) info returned by Msg ID 1040.
class TPLinkConnectedClient {
  final String mac;
  final String ip;
  final String hostname;
  final String connType;
  final bool isBlocked;
  final int upSpeed;
  final int downSpeed;

  const TPLinkConnectedClient({
    required this.mac,
    required this.ip,
    required this.hostname,
    required this.connType,
    required this.isBlocked,
    required this.upSpeed,
    required this.downSpeed,
  });

  factory TPLinkConnectedClient.fromJson(Map<String, dynamic> json) {
    return TPLinkConnectedClient(
      mac: (json['mac'] as String?)?.isNotEmpty == true ? json['mac'] as String : 'N/A',
      ip: (json['ip'] as String?)?.isNotEmpty == true ? json['ip'] as String : 'N/A',
      hostname: (json['hostname'] as String?)?.isNotEmpty == true ? json['hostname'] as String : 'N/A',
      connType: (json['conn_type'] as String?)?.isNotEmpty == true ? json['conn_type'] as String : 'N/A',
      isBlocked: json['blocked'] as bool? ?? false,
      upSpeed: (json['up_speed'] as num?)?.toInt() ?? 0,
      downSpeed: (json['down_speed'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mac': mac,
      'ip': ip,
      'hostname': hostname,
      'connType': connType,
      'isBlocked': isBlocked,
      'upSpeed': upSpeed,
      'downSpeed': downSpeed,
    };
  }
}

/// Wi-Fi band configuration parameters.
class TPLinkWifiBand {
  final bool enable;
  final String ssid;
  final int channel;
  final bool hidden;
  final String? password;

  const TPLinkWifiBand({
    required this.enable,
    required this.ssid,
    required this.channel,
    required this.hidden,
    this.password,
  });

  factory TPLinkWifiBand.fromJson(Map<String, dynamic> json) {
    return TPLinkWifiBand(
      enable: json['enable'] as bool? ?? true,
      ssid: (json['ssid'] as String?)?.isNotEmpty == true ? json['ssid'] as String : 'N/A',
      channel: (json['channel'] as num?)?.toInt() ?? 0,
      hidden: json['hidden'] as bool? ?? false,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enable': enable,
      'ssid': ssid,
      'channel': channel,
      'hidden': hidden,
      if (password != null) 'password': password,
    };
  }
}

/// Wi-Fi settings returned by Msg ID 1800 or 1056.
class TPLinkWifiSettings {
  final TPLinkWifiBand? wifi2g;
  final TPLinkWifiBand? wifi5g;

  const TPLinkWifiSettings({
    this.wifi2g,
    this.wifi5g,
  });

  factory TPLinkWifiSettings.fromJson(Map<String, dynamic> json) {
    final g2 = json['wifi_2g'] is Map<String, dynamic>
        ? TPLinkWifiBand.fromJson(json['wifi_2g'] as Map<String, dynamic>)
        : null;
    final g5 = json['wifi_5g'] is Map<String, dynamic>
        ? TPLinkWifiBand.fromJson(json['wifi_5g'] as Map<String, dynamic>)
        : null;
    return TPLinkWifiSettings(wifi2g: g2, wifi5g: g5);
  }

  Map<String, dynamic> toJson() {
    return {
      'wifi2g': wifi2g?.toJson(),
      'wifi5g': wifi5g?.toJson(),
    };
  }
}

/// WAN / Internet connection status returned by Msg ID 2101 / 2131.
class TPLinkWanStatus {
  final String ip;
  final String status;
  final String mask;
  final String gateway;
  final String dns;
  final String connType;

  const TPLinkWanStatus({
    required this.ip,
    required this.status,
    required this.mask,
    required this.gateway,
    required this.dns,
    required this.connType,
  });

  factory TPLinkWanStatus.fromJson(Map<String, dynamic> json) {
    final wan = json['wan_status'] ?? json['wan'] ?? json;
    final rawIp = wan['ip'] as String?;
    final rawGateway = wan['gateway'] as String?;
    final rawMask = wan['netmask'] as String? ?? wan['mask'] as String?;
    final rawDns = wan['dns'] as String? ?? wan['dns_servers'] as String?;
    final rawStatus = wan['status'] as String?;
    final rawConn = wan['conn_type'] as String?;

    return TPLinkWanStatus(
      ip: (rawIp != null && rawIp.isNotEmpty && rawIp != '0.0.0.0') ? rawIp : 'N/A',
      status: (rawStatus != null && rawStatus.isNotEmpty) ? rawStatus : 'N/A',
      mask: (rawMask != null && rawMask.isNotEmpty && rawMask != '0.0.0.0') ? rawMask : 'N/A',
      gateway: (rawGateway != null && rawGateway.isNotEmpty && rawGateway != '0.0.0.0') ? rawGateway : 'N/A',
      dns: (rawDns != null && rawDns.isNotEmpty) ? rawDns : 'N/A',
      connType: (rawConn != null && rawConn.isNotEmpty) ? rawConn : 'N/A',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ip': ip,
      'status': status,
      'mask': mask,
      'gateway': gateway,
      'dns': dns,
      'connType': connType,
    };
  }
}
