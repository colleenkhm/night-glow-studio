import 'package:flutter/material.dart';
import 'app_footer.dart';
import 'app_header.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NsAppBar(),
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text('a toolkit for creatives, a portal for explorers, and an arcade for procrastinators. inspired by many late nights in high school and college'),
              ),
            ),
          ),
          NsFooter(),
        ],
      ),
    );
  }
}
