import 'package:flutter/material.dart';
import 'package:onest_all_router_app/database/local/database.dart';
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

  @override
  Widget build(BuildContext context) {
    final db = AppDatabase.instance;

    return StreamBuilder<List<Brand>>(
      stream: db.brandsDao.watchAllBrands(),
      builder: (context, brandsSnapshot) {
        final brands = brandsSnapshot.data ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Brand Dropdown
            ValueListenableBuilder<String?>(
              valueListenable: selectedBrand,
              builder: (context, brandName, child) {
                return CustomDropdownWidget<String>(
                  label: 'Router Brand',
                  value: brandName,
                  hint: brands.isEmpty ? 'Loading brands...' : 'Select brand',
                  items: brands.map((b) => b.name).toList(),
                  onChanged: brands.isEmpty
                      ? null
                      : (newBrand) {
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
              builder: (context, brandName, child) {
                final modelsStream = brandName != null
                    ? db.routerModelsDao.watchModelsForBrandSlug(brandName.toLowerCase().replaceAll(' ', '-'))
                    : const Stream<List<RouterModel>>.empty();

                return StreamBuilder<List<RouterModel>>(
                  stream: modelsStream,
                  builder: (context, modelsSnapshot) {
                    final models = modelsSnapshot.data ?? [];
                    return ValueListenableBuilder<String?>(
                      valueListenable: selectedModel,
                      builder: (context, modelName, child) {
                        return CustomDropdownWidget<String>(
                          label: 'Router Model',
                          value: modelName,
                          hint: brandName != null
                              ? (modelsSnapshot.connectionState == ConnectionState.waiting
                                  ? 'Loading models...'
                                  : 'Select model')
                              : 'Select a brand first',
                          items: models.map((m) => m.name).toList(),
                          onChanged: brandName != null && models.isNotEmpty
                              ? (newModel) {
                                  selectedModel.value = newModel;
                                }
                              : null,
                        );
                      },
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
                  return StreamBuilder<List<FirmwareType>>(
                    stream: db.firmwareTypesDao.watchCustomFirmwares(),
                    builder: (context, firmwareSnapshot) {
                      final cFirmwares = firmwareSnapshot.data ?? [];
                      return Column(
                        children: [
                          const SizedBox(height: 20),
                          ValueListenableBuilder<String?>(
                            valueListenable: customFirmware,
                            builder: (context, custom, child) {
                              return CustomDropdownWidget<String>(
                                label: 'Custom Firmware Type',
                                value: custom,
                                hint: cFirmwares.isEmpty
                                    ? (firmwareSnapshot.connectionState == ConnectionState.waiting
                                        ? 'Loading firmwares...'
                                        : 'No custom firmwares')
                                    : 'Select firmware',
                                items: cFirmwares.map((cf) => cf.name).toList(),
                                onChanged: cFirmwares.isNotEmpty
                                    ? (newCf) {
                                        customFirmware.value = newCf;
                                      }
                                    : null,
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        );
      },
    );
  }
}
