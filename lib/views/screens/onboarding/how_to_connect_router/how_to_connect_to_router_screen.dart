import 'package:flutter/material.dart';
import 'package:onest_all_router_app/views/screens/onboarding/how_to_connect_router/sections/how_to_connect_router_appbar_section.dart';
import 'package:onest_all_router_app/views/screens/onboarding/how_to_connect_router/sections/how_to_connect_router_description_section.dart';
import 'package:onest_all_router_app/views/screens/onboarding/how_to_connect_router/sections/how_to_connect_router_header_section.dart';

class HowToConnectToRouterScreen extends StatelessWidget {
  const HowToConnectToRouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF3F5FC),
      appBar: HowToConnectRouterAppbarSection(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: HowToConnectRouterHeaderSection(),
              ),
              HowToConnectRouterDescriptionSection(),
            ],
          ),
        ),
      ),
    );
  }
}
