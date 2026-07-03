import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectRouterAppbarSection extends StatelessWidget implements PreferredSizeWidget {
  const SelectRouterAppbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Color(0xFF1B1B1E),
          size: 22,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'STEP 1 OF 3',
            style: GoogleFonts.outfit(
              color: const Color(0xFF2D29D4),
              fontWeight: FontWeight.bold,
              fontSize: 11,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Choose Your Router',
            style: GoogleFonts.outfit(
              color: const Color(0xFF1B1B1E),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 8);
}
