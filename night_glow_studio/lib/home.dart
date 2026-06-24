import 'package:flutter/material.dart';
import 'app_header.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NsAppBar(showActions: false),
      body: Center(
    child: Wrap(children: [
      TextButton(onPressed: () => Navigator.pushNamed(context, '/words'),
      child: const Text('words'),
      ),
      const SizedBox(width: 8),
      TextButton(onPressed: () => Navigator.pushNamed(context, '/music'),
      child: const Text('music'),
      ),
      const SizedBox(width: 8),
      TextButton(onPressed: () => Navigator.pushNamed(context, '/about'),
      child: const Text('about'),
      ),
      const SizedBox(width: 8),
    ]))
    );
  }
}