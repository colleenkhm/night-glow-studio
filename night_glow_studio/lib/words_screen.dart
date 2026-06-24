import 'package:flutter/material.dart';
import 'app_header.dart';

class WordsScreen extends StatelessWidget {
  const WordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NsAppBar(),
      body: const Center(
        child: Text('words'),
      ),
    );
  }
}
