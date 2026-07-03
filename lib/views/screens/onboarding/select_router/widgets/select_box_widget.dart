import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectBoxWidget extends StatelessWidget {
  final String label;
  final String? value;
  final Widget? prefixIcon;
  final VoidCallback onTap;
  final String hint;
  final bool enabled;

  const SelectBoxWidget({
    super.key,
    required this.label,
    required this.value,
    required this.prefixIcon,
    required this.onTap,
    required this.hint,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: enabled ? const Color(0xFF5E6272) : const Color(0xFF9EA3B2),
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: enabled ? Colors.white : const Color(0x0C1B1B1E),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: value != null
                    ? const Color(0xFF2D29D4)
                    : (enabled ? const Color(0xFFE2E4EC) : const Color(0x7FE2E4EC)),
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                if (prefixIcon != null) ...[
                  Opacity(
                    opacity: enabled ? 1.0 : 0.5,
                    child: prefixIcon!,
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Text(
                    value ?? hint,
                    style: GoogleFonts.outfit(
                      color: value != null
                          ? (enabled ? const Color(0xFF1B1B1E) : const Color(0xFF5E6272))
                          : const Color(0xFF9EA3B2),
                      fontSize: 15,
                      fontWeight: value != null ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: enabled ? const Color(0xFF5E6272) : const Color(0xFF9EA3B2),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
