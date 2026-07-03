import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EstablishConnectionResultSection extends StatelessWidget {
  final String state;
  final String brand;
  final String model;
  final String firmware;
  final VoidCallback onRetry;

  const EstablishConnectionResultSection({
    super.key,
    required this.state,
    required this.brand,
    required this.model,
    required this.firmware,
    required this.onRetry,
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


  @override
  Widget build(BuildContext context) {
    final isSuccess = state == 'success';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Illustration Badge
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: isSuccess ? const Color(0xFF2D29D4) : const Color(0xFFFFEBE6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isSuccess ? Icons.check_rounded : Icons.close_rounded,
                    color: Colors.white,
                    size: 48,
                  ),
                ),
                const SizedBox(height: 24),
                // Title
                Text(
                  isSuccess ? 'Connection Successful' : 'Connection Failed',
                  style: GoogleFonts.outfit(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1B1B1E),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 0),
                // Subtitle / Info
                Text(
                  isSuccess
                      ? 'Your phone is now securely connected to the router. You can review the details below.'
                      : 'We were unable to reach your router. Please verify your WiFi configuration and try again.',
                  style: GoogleFonts.outfit(
                    fontSize: 15,
                    color: const Color(0xFF5E6272),
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Router Information Card (Success State)
                if (isSuccess)
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
                        _buildInfoRow('SSID', 'AeroLink'),
                        _buildInfoRow('BSSID', '3C:84:6A:21:8D:AF'),
                        _buildInfoRow('Gateway', '192.168.1.1'),
                        _buildInfoRow('Device IP', '192.168.1.120'),
                        _buildInfoRow('Subnet', '255.255.255.0'),
                        _buildInfoRow('DNS', '8.8.8.8'),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          
          // Action Buttons
          ElevatedButton(
            onPressed: isSuccess
                ? () {
                    // Navigate home / complete onboarding
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreen()));
                  }
                : onRetry,
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
              isSuccess ? 'Continue' : 'Retry Connection',
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
