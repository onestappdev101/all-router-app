import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:onest_all_router_app/viewmodels/establish_connection_viewmodel.dart';
import 'package:onest_all_router_app/views/screens/onboarding/establish_connection/sections/establish_connection_appbar_section.dart';
import 'package:onest_all_router_app/views/screens/onboarding/establish_connection/sections/establish_connection_loading_section.dart';
import 'package:onest_all_router_app/views/screens/onboarding/establish_connection/sections/establish_connection_success_section.dart';
import 'package:onest_all_router_app/views/screens/onboarding/establish_connection/sections/establish_connection_failure_section.dart';

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EstablishConnectionViewModel()..checkConnection(brand),
      child: Consumer<EstablishConnectionViewModel>(
        builder: (context, viewModel, _) {
          return Scaffold(
            backgroundColor: const Color(0xFFF3F5FC),
            appBar: const EstablishConnectionAppbarSection(),
            body: SafeArea(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: viewModel.isLoading
                    ? const EstablishConnectionLoadingSection(key: ValueKey('loading'))
                    : viewModel.errorMessage != null
                        ? EstablishConnectionFailureSection(
                            errorMessage: viewModel.errorMessage!,
                            key: const ValueKey('error'),
                          )
                        : EstablishConnectionSuccessSection(
                            brand: brand,
                            model: model,
                            firmware: firmware,
                            networkInfo: viewModel.networkInfo,
                            key: const ValueKey('success'),
                          ),
              ),
            ),
          );
        },
      ),
    );
  }
}
