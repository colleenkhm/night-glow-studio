import 'package:flutter/material.dart';
import 'site_hub_screen.dart';

class WordsScreen extends StatelessWidget {
  const WordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteHubScreen(
      cards: [
        SiteCardData(
          title: 'scaler',
          description: 'an app to help users discover what scale a song could be in',
          tags: ['music'],
          url: 'https://colleenkhm.github.io/scaler/',
        ),
        SiteCardData(
          title: 'just a word',
          description: 'an app for users to look up word definitions',
          tags: ['words', 'writing'],
          url: 'https://www.just-a-word.com/',
        ),
        SiteCardData(
          title: 'chordfinder',
          description: 'a hub for all piano and guitar chords a user might want to see laid out clearly',
          tags: ['music'],
        ),
      ],
    );
  }
}
