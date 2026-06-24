import 'package:flutter/material.dart';
import 'app_header.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NsAppBar(),
      body: const Center(
        child: Text('games'),
      ),
    );
  }
}
