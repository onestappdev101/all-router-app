import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectRouterTitleSubtitleSection extends StatelessWidget {
  const ConnectRouterTitleSubtitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Is your router connected to\nyour phone?',
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1B1B1E),
            height: 1.25,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 16),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.outfit(
              fontSize: 15,
              color: const Color(0xFF5E6272),
              height: 1.45,
            ),
            children: [
              const TextSpan(text: 'Check your Wi-Fi settings to ensure your\nphone is connected to '),
              TextSpan(
                text: 'your router',
                style: GoogleFonts.outfit(
                  color: const Color(0xFF2D29D4),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(text: '.'),
            ],
          ),
        ),
      ],
    );
  }
}
