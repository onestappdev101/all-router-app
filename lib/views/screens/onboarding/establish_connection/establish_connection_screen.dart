import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:onest_all_router_app/views/screens/onboarding/establish_connection/sections/establish_connection_appbar_section.dart';
import 'package:onest_all_router_app/views/screens/onboarding/establish_connection/sections/establish_connection_loading_section.dart';
import 'package:onest_all_router_app/views/screens/onboarding/establish_connection/sections/establish_connection_result_section.dart';

class EstablishConnectionScreen extends StatelessWidget {
  final String brand;
  final String model;
  final String firmware;

  const EstablishConnectionScreen({
    super.key,
    required this.brand,
    required this.model,
    required this.firmware,
  });

  void _startConnectionSimulation(ValueNotifier<String> connectionState) {
    connectionState.value = 'loading';
    Timer(const Duration(seconds: 2), () {
      final isSuccess = Random().nextDouble() < 0.7;
      connectionState.value = isSuccess ? 'success' : 'failed';
    });
  }

  @override
  Widget build(BuildContext context) {
    final connectionState = ValueNotifier<String>('loading');
    _startConnectionSimulation(connectionState);

    return Scaffold(
      backgroundColor: const Color(0xFFF3F5FC),
      appBar: const EstablishConnectionAppbarSection(),
      body: SafeArea(
        child: ValueListenableBuilder<String>(
          valueListenable: connectionState,
          builder: (context, state, child) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: state == 'loading'
                  ? EstablishConnectionLoadingSection(key: const ValueKey('loading'))
                  : EstablishConnectionResultSection(
                      key: const ValueKey('result'),
                      state: state,
                      brand: brand,
                      model: model,
                      firmware: firmware,
                      onRetry: () => _startConnectionSimulation(connectionState),
                    ),
            );
          },
        ),
      ),
    );
  }
}
