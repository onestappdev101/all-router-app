import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:drift_local_storage_inspector/drift_local_storage_inspector.dart';
import 'package:storage_inspector/storage_inspector.dart';
import 'package:onest_all_router_app/database/local/database.dart';
import 'package:onest_all_router_app/viewmodels/login_viewmodel.dart';
import 'package:onest_all_router_app/views/screens/onboarding/are_you_conntected_with_router/connect_router_screen.dart';

// Keep a global reference to the StorageServerDriver to prevent it from being garbage collected
StorageServerDriver? inspectorDriver;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    print('Starting Storage Inspector...');
    inspectorDriver = StorageServerDriver(
      bundleId: 'com.example.onest_all_router_app',
      icon: 'flutter',
      port: 49152,
    );
    
    inspectorDriver!.addSQLServer(
      DriftSQLDatabaseServer(
        id: 'router_hub_db_id',
        name: 'Router Hub Database',
        database: AppDatabase.instance,
      ),
    );
    
    inspectorDriver!.start().then((_) {
      print('Storage Inspector Started');
    }).catchError((e) {
      print('Failed to start Storage Inspector: $e');
    });
  }
  
  // Run the database debug method in the background without blocking the UI
  AppDatabase.instance.debugDatabase().catchError((e) {
    print('Database debug failed: $e');
  });

  runApp(
    ChangeNotifierProvider(
      create: (_) => LoginViewmodel(),
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

