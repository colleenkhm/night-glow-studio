import 'package:flutter/material.dart';
import 'app_header.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NsAppBar(),
      body: const Center(
        child: Text('music'),
      ),
    );
  }
}
