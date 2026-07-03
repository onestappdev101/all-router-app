import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectRouterSummarySection extends StatelessWidget {
  final ValueNotifier<String?> selectedBrand;
  final ValueNotifier<String?> selectedModel;
  final ValueNotifier<String> firmwareType;
  final ValueNotifier<String?> customFirmware;

  const SelectRouterSummarySection({
    super.key,
    required this.selectedBrand,
    required this.selectedModel,
    required this.firmwareType,
    required this.customFirmware,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([selectedBrand, selectedModel, firmwareType, customFirmware]),
      builder: (context, child) {
        final brand = selectedBrand.value;
        final model = selectedModel.value;
        final type = firmwareType.value;
        final cf = customFirmware.value;

        final isBrandSelected = brand != null;
        final isModelSelected = model != null;
        final isFirmwareValid = type == 'Stock' || cf != null;
        final isComplete = isBrandSelected && isModelSelected && isFirmwareValid;

        return AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isComplete) ...[
                const SizedBox(height: 24),
                _buildCompatibilityCard(brand, model, type, cf),
              ] else ...[
                const SizedBox(height: 24),
                _buildHelpfulTipCard(),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildCompatibilityCard(String brand, String model, String type, String? cf) {
    bool isExperimental = brand == 'Xiaomi' || brand == 'Huawei' || cf == 'Other / Custom Build';
    
    final statusTitle = isExperimental ? 'Experimental Support' : 'Compatible';
    final statusColor = isExperimental ? const Color(0xFFDF8B00) : const Color(0xFF00875A);
    final statusBg = isExperimental ? const Color(0xFFFFF8EC) : const Color(0xFFE3FCEF);
    final statusBorder = isExperimental ? const Color(0xFFFFE3B3) : const Color(0xFFABF5D1);
    final statusIcon = isExperimental ? Icons.warning_amber_rounded : Icons.check_circle_outline_rounded;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: statusBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: statusBorder, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(statusIcon, color: statusColor, size: 22),
              const SizedBox(width: 8),
              Text(
                statusTitle,
                style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '$brand $model',
            style: GoogleFonts.outfit(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1B1B1E),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Firmware: ${type == 'Custom' ? cf : 'Stock / Original'}',
            style: GoogleFonts.outfit(
              fontSize: 14,
              color: const Color(0xFF5E6272),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0x1F1B1B1E), height: 1),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.access_time_rounded, color: Color(0xFF5E6272), size: 18),
              const SizedBox(width: 8),
              Text(
                'Estimated setup:',
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  color: const Color(0xFF5E6272),
                ),
              ),
              const Spacer(),
              Text(
                '30 seconds',
                style: GoogleFonts.outfit(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1B1B1E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHelpfulTipCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF0F7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.lightbulb_outline_rounded,
            color: Color(0xFF2D29D4),
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Tip: The router model is usually printed on the sticker underneath the router.',
              style: GoogleFonts.outfit(
                fontSize: 13,
                color: const Color(0xFF5E6272),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
