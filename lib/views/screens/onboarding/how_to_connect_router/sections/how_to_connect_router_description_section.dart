import 'package:flutter/material.dart';
import 'package:onest_all_router_app/views/screens/onboarding/are_you_conntected_with_router/widgets/router_setup_card_widget.dart';

class HowToConnectRouterDescriptionSection extends StatelessWidget {
  const HowToConnectRouterDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RouterSetupCardWidget(
          title: 'First-Time Setup (Factory Default)',
          steps: [
            'Power on the router and wait until it finishes booting.',
            'Open Wi-Fi Settings on your phone.',
            'Connect to the router\'s default Wi-Fi network (SSID), printed on the router label or included in the user manual.',
            'If prompted, enter the default Wi-Fi password found on the router label.',
            'Return to the app and tap Continue.',
          ],
          note:
              'If no password is printed on the router, the default network may be open (no password required).',
        ),
        SizedBox(height: 24),
        RouterSetupCardWidget(
          title: 'Existing Router Setup',
          description: 'Use this option if the router has already been configured.',
          steps: [
            'Ensure the router is powered on.',
            'Open Wi-Fi Settings on your phone.',
            'Connect to your router using its current Wi-Fi name (SSID).',
            'Enter the custom Wi-Fi password that was previously configured.',
            'Return to the app and tap Continue.',
          ],
          note:
              'If you\'ve forgotten the Wi-Fi password, you\'ll need to recover it from a connected device or reset the router to factory settings before continuing.',
        ),
      ],
    );
  }
}
