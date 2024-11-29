import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/calendar/presentation/screen/add_event_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const FocusManagementApp());
}

class FocusManagementApp extends StatelessWidget {
  const FocusManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const AddEventScreen(isEdit: false),
    );
  }
}
