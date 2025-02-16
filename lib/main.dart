import 'package:flutter/material.dart';
import 'package:flutter_playground/home_screen.dart';

void main() {
  runApp(const PlaygroundApp());
}

class PlaygroundApp extends StatelessWidget {
  const PlaygroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playground',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade300,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey.shade300),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
