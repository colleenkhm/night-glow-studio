import 'package:flutter/material.dart';
import 'app_header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Removes the debug banner in the corner
      title: 'night glow studio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const BlankScreen(),
    );
  }
}

class BlankScreen extends StatelessWidget {
  const BlankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NsAppBar(),
      body: Center(
        child: Text('night glow studio', style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}