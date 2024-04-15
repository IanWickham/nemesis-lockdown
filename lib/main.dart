import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;
  runApp(const StaticApp());
}

class StaticApp extends StatelessWidget {
  const StaticApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nemesis Lockdown Companion App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}
