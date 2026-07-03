import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectRouterHeaderSection extends StatelessWidget {
  final bool hasSelection;

  const SelectRouterHeaderSection({
    super.key,
    required this.hasSelection,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Find your router model to continue onboarding.',
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            color: const Color(0xFF5E6272),
            fontSize: 15,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: !hasSelection
              ? Container(
                  key: const ValueKey('empty_state'),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  decoration: BoxDecoration(
                    color: const Color(0x062D29D4),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: const Color(0x0F2D29D4), width: 1.5),
                  ),
                  child: Column(
                    children: [
                      const Opacity(
                        opacity: 0.15,
                        child: Icon(
                          Icons.router_rounded,
                          size: 72,
                          color: Color(0xFF2D29D4),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'No Router Selected Yet',
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF5E6272),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Start by selecting your router brand below.',
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          color: const Color(0xFF9EA3B2),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(key: ValueKey('active_state')),
        ),
      ],
    );
  }
}
