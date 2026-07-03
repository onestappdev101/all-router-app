import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SegmentControlWidget extends StatelessWidget {
  final String label;
  final String selectedValue;
  final List<String> values;
  final ValueChanged<String> onChanged;

  const SegmentControlWidget({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.values,
    required this.onChanged,
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
            color: const Color(0xFF5E6272),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 54,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF0F7),
            borderRadius: BorderRadius.circular(27),
          ),
          child: Row(
            children: values.map((val) {
              final isSelected = val == selectedValue;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onChanged(val),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF2D29D4) : Colors.transparent,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      val,
                      style: GoogleFonts.outfit(
                        color: isSelected ? Colors.white : const Color(0xFF5E6272),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
