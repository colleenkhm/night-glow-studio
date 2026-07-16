import 'package:flutter/material.dart';
import 'site_data.dart';
import 'site_hub_screen.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteHubScreen(cards: libraryCards);
  }
}
