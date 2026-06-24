import 'package:flutter/material.dart';
import 'app_header.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NsAppBar(),
      body: const Center(
        child: Text('about'),
      ),
    );
  }
}
