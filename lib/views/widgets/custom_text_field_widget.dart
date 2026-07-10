import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomTextFieldWidget extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomTextFieldWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.focusNode,
    this.obscureText = false,
    this.suffixIcon,
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
        AnimatedBuilder(
          animation: focusNode,
          builder: (context, child) {
            final hasFocus = focusNode.hasFocus;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: hasFocus ? const Color(0xFF2D29D4) : const Color(0xFFE2E4EC),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      obscureText: obscureText,
                      style: GoogleFonts.outfit(
                        color: const Color(0xFF1B1B1E),
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: GoogleFonts.outfit(
                          color: const Color(0xFF9EA3B2),
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  ?suffixIcon,
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

