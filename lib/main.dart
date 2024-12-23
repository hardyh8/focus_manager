import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/router/router.dart';
import 'core/utils/get_it/get_it_instance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const FocusManagementApp());
}

class FocusManagementApp extends StatelessWidget {
  const FocusManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
