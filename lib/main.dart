import 'package:flutter/material.dart';
import 'screens/example_components_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatar Component Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Inter'),
      home: const ExampleComponentsScreen(),
    );
  }
}
