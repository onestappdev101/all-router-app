import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectableChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Widget? icon;
  final VoidCallback onTap;

  const SelectableChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2D29D4) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF2D29D4) : const Color(0xFFE2E4EC),
            width: 1.5,
          ),
          boxShadow: isSelected
              ? const [
                  BoxShadow(
                    color: Color(0x242D29D4),
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  )
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              IconTheme(
                data: IconThemeData(
                  color: isSelected ? Colors.white : const Color(0xFF5E6272),
                  size: 18,
                ),
                child: icon!,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: GoogleFonts.outfit(
                color: isSelected ? Colors.white : const Color(0xFF1B1B1E),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
