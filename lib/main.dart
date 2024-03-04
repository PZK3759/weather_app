import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(const RootApp());
}


class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
