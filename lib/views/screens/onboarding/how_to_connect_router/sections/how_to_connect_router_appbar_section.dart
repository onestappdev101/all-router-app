import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowToConnectRouterAppbarSection extends StatelessWidget implements PreferredSizeWidget {
  const HowToConnectRouterAppbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Color(0xFF1B1B1E),
          size: 18,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        'How to Connect',
        style: GoogleFonts.outfit(
          color: const Color(0xFF1B1B1E),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
