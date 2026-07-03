import 'package:flutter/material.dart';
import 'package:onest_all_router_app/views/screens/onboarding/are_you_conntected_with_router/sections/connect_router_title_subtitle_section.dart';
import 'package:onest_all_router_app/views/screens/onboarding/are_you_conntected_with_router/sections/connected_router_button_section.dart';
import 'package:onest_all_router_app/views/screens/onboarding/are_you_conntected_with_router/sections/router_phone_image_section.dart';
class ConnectRouterScreen extends StatelessWidget {
  const ConnectRouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FC),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 32.0, 24.0, 16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const RouterPhoneImageSection(),
              const ConnectRouterTitleSubtitleSection(),
              const Spacer(),
              const ConnectedRouterButtonSection(),
            ],
          ),
        ),
      ),
    );
  }
}
