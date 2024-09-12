import 'package:flutter/material.dart';
import 'package:medi_track/screens/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediTrack',
      theme: ThemeData(),
      home: const LoginScreen(),
    );
  }
}
