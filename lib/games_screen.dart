import 'package:flutter/material.dart';
import 'site_hub_screen.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteHubScreen(
      cards: [
        SiteCardData(
          title: 'fancy pants adventure',
          description: 'a side-scrolling platformer starring a stick-figure in fancy pants, known for its fluid running and jumping',
          tags: ['games'],
          url: 'https://www.newgrounds.com/portal/view/301341',
        ),
        SiteCardData(
          title: 'redactle',
          description: 'uncovers a redacted Wikipedia article one guessed word at a time until you can identify the topic',
          tags: ['games', 'words'],
          url: 'https://redactle.net/',
        ),
        SiteCardData(
          title: 'contexto',
          description: 'a daily word-guessing game that scores each guess by how semantically close it is to the secret word',
          tags: ['games', 'words'],
          url: 'https://contexto.me/',
        ),
        // No url yet - not confident in a current, correct link for this one.
        SiteCardData(
          title: 'a dark room',
          description: 'a minimalist text-based survival game that starts with just a dying fire and grows into an exploration of what lies beyond',
          tags: ['games'],
        ),
      ],
    );
  }
}
