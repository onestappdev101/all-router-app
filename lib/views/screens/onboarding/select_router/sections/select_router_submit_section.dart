import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onest_all_router_app/views/screens/onboarding/establish_connection/establish_connection_screen.dart';

class SelectRouterSubmitSection extends StatelessWidget {
  final ValueNotifier<String?> selectedBrand;
  final ValueNotifier<String> firmwareType;
  final ValueNotifier<String?> customFirmware;

  const SelectRouterSubmitSection({
    super.key,
    required this.selectedBrand,
    required this.firmwareType,
    required this.customFirmware,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([selectedBrand, firmwareType, customFirmware]),
      builder: (context, child) {
        final isBrandSelected = selectedBrand.value != null;
        final isFirmwareValid = firmwareType.value == 'Stock' || customFirmware.value != null;
        final isEnabled = isBrandSelected && isFirmwareValid;

        return ElevatedButton(
          onPressed: isEnabled
              ? () {
                  final brandVal = selectedBrand.value!;
                  const modelVal = 'Generic Model';
                  final firmwareVal = firmwareType.value == 'Custom'
                      ? customFirmware.value!
                      : 'Stock';

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EstablishConnectionScreen(
                        brand: brandVal,
                        model: modelVal,
                        firmware: firmwareVal,
                      ),
                    ),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2D29D4),
            foregroundColor: Colors.white,
            disabledBackgroundColor: const Color(0xFFE2E4EC),
            disabledForegroundColor: const Color(0xFF9EA3B2),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: Text(
            'Continue',
            style: GoogleFonts.outfit(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
