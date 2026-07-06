import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../login/login_screen.dart';
import 'sections/establish_connection_appbar_section.dart';
import 'sections/establish_connection_loading_section.dart';

class EstablishConnectionScreen extends StatefulWidget {
  final String brand;
  final String model;
  final String firmware;

  const EstablishConnectionScreen({
    super.key,
    required this.brand,
    required this.model,
    required this.firmware,
  });

  @override
  State<EstablishConnectionScreen> createState() => _EstablishConnectionScreenState();
}

class _EstablishConnectionScreenState extends State<EstablishConnectionScreen> {
  bool _isLoading = true;
  String? _errorMessage;
  Map<String, String?>? _networkInfo;

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<Map<String, String?>> _fetchNetworkInfo() async {
    final info = NetworkInfo();
    final wifiName = await info.getWifiName();
    final wifiBSSID = await info.getWifiBSSID();
    final wifiIP = await info.getWifiIP();
    final wifiIPv6 = await info.getWifiIPv6();
    final wifiSubmask = await info.getWifiSubmask();
    final wifiBroadcast = await info.getWifiBroadcast();
    final wifiGateway = await info.getWifiGatewayIP();

    return {
      'wifiName': wifiName,
      'wifiBSSID': wifiBSSID,
      'wifiIP': wifiIP,
      'wifiIPv6': wifiIPv6,
      'wifiSubmask': wifiSubmask,
      'wifiBroadcast': wifiBroadcast,
      'wifiGateway': wifiGateway,
    };
  }

  Future<void> _checkConnection() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _networkInfo = null;
    });

    Map<String, String?>? infoResult;
    try {
      infoResult = await _fetchNetworkInfo().timeout(const Duration(seconds: 6));
    } catch (e) {
      debugPrint("Fetch network info timed out or failed: $e");
    }

    final connectivityResult = await Connectivity().checkConnectivity();
    final isConnected = connectivityResult.any((result) => result != ConnectivityResult.none);

    if (!mounted) return;

    if (!isConnected) {
      setState(() {
        _isLoading = false;
        _errorMessage = "You are not connected to any network. Please connect to a network to proceed.";
      });
      _showNoConnectionDialog();
    } else {
      setState(() {
        _isLoading = false;
        _networkInfo = infoResult ?? {
          'wifiName': 'Connected Network',
          'wifiBSSID': 'N/A',
          'wifiIP': 'N/A',
          'wifiIPv6': 'N/A',
          'wifiSubmask': 'N/A',
          'wifiBroadcast': 'N/A',
          'wifiGateway': 'N/A',
        };
      });
    }
  }

  void _showNoConnectionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          title: Text(
            'No Connection',
            style: GoogleFonts.outfit(
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1B1B1E),
            ),
          ),
          content: Text(
            'Please connect to a network to get the router information.',
            style: GoogleFonts.outfit(
              color: const Color(0xFF5E6272),
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close dialog
                Navigator.pop(context);
                // Go back to the router select page (pop the connection screen)
                Navigator.pop(this.context);
              },
              child: Text(
                'Go Back',
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2D29D4),
                  fontSize: 15,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String _cleanWifiName(String? name) {
    if (name == null || name.isEmpty) return 'Connected Network';
    if (name.startsWith('"') && name.endsWith('"')) {
      return name.substring(1, name.length - 1);
    }
    return name;
  }

  Widget _getBrandLogo(String brand, {double size = 40}) {
    final Map<String, Color> brandColors = {
      'TP-Link': const Color(0xFF00A9E0),
      'Netgear': const Color(0xFFFFB81C),
      'Asus': const Color(0xFF00539B),
      'Linksys': const Color(0xFF002244),
      'D-Link': const Color(0xFF0077C8),
      'Xiaomi': const Color(0xFFFF6700),
      'Huawei': const Color(0xFFE20613),
      'Mikrotik': const Color(0xFF005A9C),
    };

    final initials = brand.length >= 2 ? brand.substring(0, 2).toUpperCase() : brand.toUpperCase();
    final bgColor = brandColors[brand] ?? const Color(0xFF5E6272);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: GoogleFonts.outfit(
          color: Colors.white,
          fontSize: size * 0.35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.outfit(
              fontSize: 14,
              color: const Color(0xFF5E6272),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1B1B1E),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FC),
      appBar: const EstablishConnectionAppbarSection(),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _isLoading
              ? const EstablishConnectionLoadingSection(key: ValueKey('loading'))
              : _errorMessage != null
                  ? Padding(
                      key: const ValueKey('error'),
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Container(
                            width: 90,
                            height: 90,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFEBE6),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close_rounded,
                              color: Color(0xFFE20613),
                              size: 48,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Connection Failed',
                            style: GoogleFonts.outfit(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1B1B1E),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _errorMessage!,
                            style: GoogleFonts.outfit(
                              fontSize: 15,
                              color: const Color(0xFF5E6272),
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2D29D4),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 2,
                              shadowColor: const Color(0x332D29D4),
                            ),
                            child: Text(
                              'Go Back to Brand Selection',
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      key: const ValueKey('success'),
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 24),
                                  Container(
                                    width: 90,
                                    height: 90,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF2D29D4),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 48,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Text(
                                    'Connection Successful',
                                    style: GoogleFonts.outfit(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF1B1B1E),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Your phone is now securely connected to the router. You can review the details below.',
                                    style: GoogleFonts.outfit(
                                      fontSize: 15,
                                      color: const Color(0xFF5E6272),
                                      height: 1.4,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 24),
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                        color: const Color(0xFFE2E4EC),
                                        width: 1.5,
                                      ),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x04000000),
                                          blurRadius: 10,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          children: [
                                            _getBrandLogo(widget.brand),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.brand,
                                                    style: GoogleFonts.outfit(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: const Color(0xFF1B1B1E),
                                                    ),
                                                  ),
                                                  Text(
                                                    widget.model,
                                                    style: GoogleFonts.outfit(
                                                      fontSize: 14,
                                                      color: const Color(0xFF5E6272),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        const Divider(color: Color(0xFFEEF0F7), height: 1),
                                        const SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Firmware Profile',
                                              style: GoogleFonts.outfit(
                                                fontSize: 14,
                                                color: const Color(0xFF5E6272),
                                              ),
                                            ),
                                            Text(
                                              widget.firmware,
                                              style: GoogleFonts.outfit(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: const Color(0xFF2D29D4),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        const Divider(color: Color(0xFFEEF0F7), height: 1),
                                        const SizedBox(height: 6),
                                        _buildInfoRow('SSID', _cleanWifiName(_networkInfo?['wifiName'])),
                                        _buildInfoRow('BSSID', _networkInfo?['wifiBSSID'] ?? 'N/A'),
                                        _buildInfoRow('IPv4 Address', _networkInfo?['wifiIP'] ?? 'N/A'),
                                        _buildInfoRow('IPv6 Address', _networkInfo?['wifiIPv6'] ?? 'N/A'),
                                        _buildInfoRow('Subnet Mask', _networkInfo?['wifiSubmask'] ?? 'N/A'),
                                        _buildInfoRow('Broadcast Address', _networkInfo?['wifiBroadcast'] ?? 'N/A'),
                                        _buildInfoRow('Gateway IP', _networkInfo?['wifiGateway'] ?? 'N/A'),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2D29D4),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 2,
                              shadowColor: const Color(0x332D29D4),
                            ),
                            child: Text(
                              'Continue',
                              style: GoogleFonts.outfit(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
