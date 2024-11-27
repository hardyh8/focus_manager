import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/home/home.dart';

void main() => runApp(const FocusManagementApp());

class FocusManagementApp extends StatelessWidget {
  const FocusManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
