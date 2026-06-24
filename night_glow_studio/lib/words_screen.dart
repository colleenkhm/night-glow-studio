import 'package:flutter/material.dart';
import 'site_hub_screen.dart';

class WordsScreen extends StatelessWidget {
  const WordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteHubScreen(
      cards: [
        SiteCardData(title: 'site 1', description: 'site 1 description', tags: ['tag 1', 'tag 2']),
        SiteCardData(title: 'site 2', description: 'site 2 description', tags: ['tag 1']),
        SiteCardData(title: 'site 3', description: 'site 3 description', tags: ['tag 1', 'tag 2']),
        SiteCardData(title: 'site 4', description: 'site 4 description', tags: ['tag 1']),
      ],
    );
  }
}
