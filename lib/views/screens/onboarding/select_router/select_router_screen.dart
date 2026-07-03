import 'package:flutter/material.dart';
import 'package:onest_all_router_app/views/screens/onboarding/select_router/sections/select_router_appbar_section.dart';
import 'package:onest_all_router_app/views/screens/onboarding/select_router/sections/select_router_form_section.dart';
import 'package:onest_all_router_app/views/screens/onboarding/select_router/sections/select_router_submit_section.dart';

class SelectRouterScreen extends StatelessWidget {
  const SelectRouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedBrand = ValueNotifier<String?>(null);
    final selectedModel = ValueNotifier<String?>(null);
    final firmwareType = ValueNotifier<String>('Stock');
    final customFirmware = ValueNotifier<String?>(null);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FC),
      appBar: const SelectRouterAppbarSection(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: SelectRouterFormSection(
                  selectedBrand: selectedBrand,
                  selectedModel: selectedModel,
                  firmwareType: firmwareType,
                  customFirmware: customFirmware,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: SelectRouterSubmitSection(
                      selectedBrand: selectedBrand,
                      selectedModel: selectedModel,
                      firmwareType: firmwareType,
                      customFirmware: customFirmware,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
