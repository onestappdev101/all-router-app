import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../login/login_screen.dart';

class EstablishConnectionSuccessSection extends StatelessWidget {
  final String brand;
  final String model;
  final String firmware;
  final Map<String, String?>? networkInfo;

  const EstablishConnectionSuccessSection({
    super.key,
    required this.brand,
    required this.model,
    required this.firmware,
    required this.networkInfo,
  });

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

  String _cleanWifiName(String? name) {
    if (name == null || name.isEmpty) return 'Connected Network';
    if (name.startsWith('"') && name.endsWith('"')) {
      return name.substring(1, name.length - 1);
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                            _getBrandLogo(brand),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    brand,
                                    style: GoogleFonts.outfit(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF1B1B1E),
                                    ),
                                  ),
                                  Text(
                                    model,
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
                              firmware,
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
                        _buildInfoRow('SSID', _cleanWifiName(networkInfo?['wifiName'])),
                        _buildInfoRow('BSSID', networkInfo?['wifiBSSID'] ?? 'N/A'),
                        _buildInfoRow('IPv4 Address', networkInfo?['wifiIP'] ?? 'N/A'),
                        _buildInfoRow('IPv6 Address', networkInfo?['wifiIPv6'] ?? 'N/A'),
                        _buildInfoRow('Subnet Mask', networkInfo?['wifiSubmask'] ?? 'N/A'),
                        _buildInfoRow('Broadcast Address', networkInfo?['wifiBroadcast'] ?? 'N/A'),
                        _buildInfoRow('Gateway IP', networkInfo?['wifiGateway'] ?? 'N/A'),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(
                    gatewayIp: networkInfo?['wifiGateway'],
                  ),
                ),
              );
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
    );
  }
}
