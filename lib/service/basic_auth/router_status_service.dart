import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

/// Thrown when the router rejects the login (matches httpAutErrorArray codes).
class RouterLoginException implements Exception {
  final String message;
  RouterLoginException(this.message);
  @override
  String toString() => 'RouterLoginException: $message';
}

/// Parsed contents of StatusRpm.htm.
class RouterStatus {
  final String firmwareVersion;
  final String hardwareVersion;
  final String lanMac;
  final String lanIp;
  final String lanSubnetMask;
  final String ssid;
  final String wirelessMac;
  final String wanMac;
  final String wanIp;
  final String wanSubnetMask;
  final String defaultGateway;
  final String dnsServers;
  final String receivedBytes;
  final String sentBytes;
  final String receivedPackets;
  final String sentPackets;

  RouterStatus({
    required this.firmwareVersion,
    required this.hardwareVersion,
    required this.lanMac,
    required this.lanIp,
    required this.lanSubnetMask,
    required this.ssid,
    required this.wirelessMac,
    required this.wanMac,
    required this.wanIp,
    required this.wanSubnetMask,
    required this.defaultGateway,
    required this.dnsServers,
    required this.receivedBytes,
    required this.sentBytes,
    required this.receivedPackets,
    required this.sentPackets,
  });

  @override
  String toString() => '''
Firmware: $firmwareVersion
Hardware: $hardwareVersion
LAN: $lanIp / $lanSubnetMask ($lanMac)
Wireless: $ssid ($wirelessMac)
WAN: $wanIp / $wanSubnetMask via $defaultGateway ($wanMac)
DNS: $dnsServers
Traffic: rx=$receivedBytes/$receivedPackets tx=$sentBytes/$sentPackets
''';
}

class RouterStatusService {
  final String baseUrl; // e.g. "http://192.168.1.1"
  final String username;
  final String password;

  RouterStatusService({
    required this.baseUrl,
    required this.username,
    required this.password,
  });

  /// Logs in and returns the session token (e.g. "JOOVCEAANSWXBIPA").
  Future<String> login() async {
    // Step 1: MD5-hash the password (this firmware requires it —
    // matches httpAutErrorArray[1] == 1 in the router's login page JS).
    final hashedPassword = md5.convert(utf8.encode(password)).toString();

    // Step 2: Basic-auth style base64("username:hashedPassword").
    final rawAuth = '$username:$hashedPassword';
    final b64Auth = base64.encode(utf8.encode(rawAuth));
    final authString = 'Basic $b64Auth';

    // Step 3: mimic JS escape() — only space and '=' actually appear here.
    final escapedAuth =
    authString.replaceAll(' ', '%20').replaceAll('=', '%3D');

    // Step 4: send the GET with the Authorization cookie attached,
    // exactly like document.cookie = "Authorization=...；path=/" would.
    final uri = Uri.parse('$baseUrl/userRpm/LoginRpm.htm?Save=Save');
    final response = await http.get(
      uri,
      headers: {
        'Cookie': 'Authorization=$escapedAuth',
      },
    );

    final body = response.body;

    // Check for httpAutErrorArray — present when login is re-shown due to an error.
    final errMatch =
    RegExp(r'httpAutErrorArray\s*=\s*new Array\(\s*(\d+)').firstMatch(body);
    if (errMatch != null) {
      final code = errMatch.group(1);
      const messages = {
        '0': 'Another administrator is already logged in.',
        '1': 'Too many failed attempts — locked out, try again in 2 hours.',
        '2': 'Username or password is incorrect.',
      };
      if (code != '3') {
        throw RouterLoginException(messages[code] ?? 'Login rejected (code $code).');
      }
    }

    // Success case: response body has a redirect like
    // location.href="/JOOVCEAANSWXBIPA/userRpm/Index.htm"
    final tokenMatch = RegExp(r'/([A-Z0-9]{16})/userRpm').firstMatch(body);
    if (tokenMatch == null) {
      throw RouterLoginException(
          'Login response had no session token and no recognizable error. '
              'Raw body: $body');
    }

    return tokenMatch.group(1)!;
  }

  /// Fetches and parses StatusRpm.htm using a session token from [login].
  Future<RouterStatus> fetchStatus(String sessionToken) async {
    final uri =
    Uri.parse('$baseUrl/$sessionToken/userRpm/StatusRpm.htm');
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw RouterLoginException(
          'Status page returned ${response.statusCode} — session token may have expired; try logging in again.');
    }

    final body = response.body;

    List<String>? extractArray(String varName) {
      final re =
      RegExp('var\\s+$varName\\s*=\\s*new Array\\(([\\s\\S]*?)\\);');
      final m = re.firstMatch(body);
      if (m == null) return null;
      return m
          .group(1)!
          .split(',')
          .map((v) => v.trim())
          .where((v) => v.isNotEmpty)
          .map((v) => v.replaceAll(RegExp(r'^"|"$'), ''))
          .toList();
    }

    final statusPara = extractArray('statusPara');
    final lanPara = extractArray('lanPara');
    final wlanPara = extractArray('wlanPara');
    final wanPara = extractArray('wanPara');
    final statistList = extractArray('statistList');

    if (statusPara == null || lanPara == null || wlanPara == null ||
        wanPara == null || statistList == null) {
      throw RouterLoginException(
          'Could not find expected data arrays in StatusRpm.htm — the page format may differ from what was captured.');
    }

    return RouterStatus(
      firmwareVersion: statusPara[5],
      hardwareVersion: statusPara[6],
      lanMac: lanPara[0],
      lanIp: lanPara[1],
      lanSubnetMask: lanPara[2],
      ssid: wlanPara[1],
      wirelessMac: wlanPara[4],
      wanMac: wanPara[1],
      wanIp: wanPara[2],
      wanSubnetMask: wanPara[4],
      defaultGateway: wanPara[7],
      dnsServers: wanPara[11],
      receivedBytes: statistList[0],
      sentBytes: statistList[1],
      receivedPackets: statistList[2],
      sentPackets: statistList[3],
    );
  }

  /// Convenience: log in and fetch status in one call.
  Future<RouterStatus> getStatus() async {
    final token = await login();
    return fetchStatus(token);
  }
}

// --- Example usage in a widget ---
//
// final service = RouterStatusService(
//   baseUrl: 'http://192.168.1.1',
//   username: 'admin',
//   password: 'admin',
// );
//
// try {
//   final status = await service.getStatus();
//   print(status);
// } on RouterLoginException catch (e) {
//   print('Login/status failed: ${e.message}');
// }
