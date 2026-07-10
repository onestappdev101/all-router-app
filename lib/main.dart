import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:onest_all_router_app/viewmodels/login_viewmodel.dart';
import 'package:onest_all_router_app/views/screens/onboarding/are_you_conntected_with_router/connect_router_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => LoginViewmodel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.outfitTextTheme(),
      ),
      home: const ConnectRouterScreen(),
    );
  }
}

