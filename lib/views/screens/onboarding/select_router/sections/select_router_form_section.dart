import 'package:flutter/material.dart';
import 'package:onest_all_router_app/views/screens/onboarding/select_router/widgets/custom_dropdown_widget.dart';
import 'package:onest_all_router_app/views/screens/onboarding/select_router/widgets/segment_control_widget.dart';

class SelectRouterFormSection extends StatelessWidget {
  final ValueNotifier<String?> selectedBrand;
  final ValueNotifier<String?> selectedModel;
  final ValueNotifier<String> firmwareType;
  final ValueNotifier<String?> customFirmware;

  const SelectRouterFormSection({
    super.key,
    required this.selectedBrand,
    required this.selectedModel,
    required this.firmwareType,
    required this.customFirmware,
  });

  static const Map<String, List<String>> brandModels = {
    'TP-Link': ['Archer C6', 'Archer AX10', 'TL-WR841N', 'Archer C80'],
    'Netgear': ['Nighthawk R7000', 'Orbi RBK50', 'AC1200', 'Nighthawk RAX40'],
    'Asus': ['RT-AC86U', 'RT-AX58U', 'ROG GT-AX11000', 'RT-AC68U'],
    'Linksys': ['WRT1900AC', 'EA7500', 'Velop Mesh', 'MR9000'],
    'D-Link': ['DIR-882', 'DIR-842', 'Covr Mesh', 'DIR-2150'],
    'Xiaomi': ['Mi Router 4A', 'Mi AIoT AX3600', 'Redmi AX6', 'Mi Router 4C'],
  };

  static const List<String> customFirmwares = [
    'OpenWrt',
    'DD-WRT',
    'Asuswrt-Merlin',
    'Tomato',
    'Padavan',
    'Other / Custom Build',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Brand Dropdown
        ValueListenableBuilder<String?>(
          valueListenable: selectedBrand,
          builder: (context, brand, child) {
            return CustomDropdownWidget<String>(
              label: 'Router Brand',
              value: brand,
              hint: 'Select brand',
              items: brandModels.keys.map((b) {
                return DropdownMenuItem<String>(
                  value: b,
                  child: Text(b),
                );
              }).toList(),
              onChanged: (newBrand) {
                selectedBrand.value = newBrand;
                selectedModel.value = null; // Reset model when brand changes
              },
            );
          },
        ),
        const SizedBox(height: 20),

        // Model Dropdown
        ValueListenableBuilder<String?>(
          valueListenable: selectedBrand,
          builder: (context, brand, child) {
            return ValueListenableBuilder<String?>(
              valueListenable: selectedModel,
              builder: (context, model, child) {
                final models = brand != null ? (brandModels[brand] ?? []) : <String>[];
                return CustomDropdownWidget<String>(
                  label: 'Router Model',
                  value: model,
                  hint: brand != null ? 'Select model' : 'Select a brand first',
                  items: models.map((m) {
                    return DropdownMenuItem<String>(
                      value: m,
                      child: Text(m),
                    );
                  }).toList(),
                  onChanged: brand != null ? (newModel) {
                    selectedModel.value = newModel;
                  } : null,
                );
              },
            );
          },
        ),
        const SizedBox(height: 20),

        // Firmware Type Segment Control
        ValueListenableBuilder<String>(
          valueListenable: firmwareType,
          builder: (context, type, child) {
            return SegmentControlWidget(
              label: 'Firmware Type',
              selectedValue: type,
              values: const ['Stock', 'Custom'],
              onChanged: (newType) {
                firmwareType.value = newType;
                if (newType == 'Stock') {
                  customFirmware.value = null;
                }
              },
            );
          },
        ),
        
        // Custom Firmware Section (shown conditionally)
        ValueListenableBuilder<String>(
          valueListenable: firmwareType,
          builder: (context, type, child) {
            if (type == 'Custom') {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  ValueListenableBuilder<String?>(
                    valueListenable: customFirmware,
                    builder: (context, custom, child) {
                      return CustomDropdownWidget<String>(
                        label: 'Custom Firmware Type',
                        value: custom,
                        hint: 'Select firmware',
                        items: customFirmwares.map((cf) {
                          return DropdownMenuItem<String>(
                            value: cf,
                            child: Text(cf),
                          );
                        }).toList(),
                        onChanged: (newCf) {
                          customFirmware.value = newCf;
                        },
                      );
                    },
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
