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
          tags: ['side-scroller', 'platformer'],
          url: 'https://www.newgrounds.com/portal/view/301341',
        ),
        SiteCardData(
          title: 'geoguessr',
          description: 'drops you into a random Street View location and challenges you to guess where in the world you are',
          tags: ['geography'],
          url: 'https://www.geoguessr.com/',
        ),
        SiteCardData(
          title: 'worldle',
          description: 'a daily guessing game where you identify a country from its silhouette',
          tags: ['geography'],
          url: 'https://worldle.teuteuf.fr/',
        ),
         SiteCardData(
          title: 'language guesser',
          description: 'plays a short music video clip and challenges you to guess what language is being spoken',
          tags: ['languages'],
          url: 'https://languageguesser.com/en',
        ),
        SiteCardData(
          title: 'redactle',
          description: 'uncovers a redacted Wikipedia article one guessed word at a time until you can identify the topic',
          tags: ['words', 'history'],
          url: 'https://redactle.net/',
        ),
        SiteCardData(
          title: 'contexto',
          description: 'a daily word-guessing game that scores each guess by how semantically close it is to the secret word',
          tags: ['words'],
          url: 'https://contexto.me/',
        ),
        // No url yet - not confident in a current, correct link for this one.
        SiteCardData(
          title: 'a dark room',
          description: 'a minimalist text-based survival game that starts with just a dying fire and grows into an exploration of what lies beyond',
          tags: ['minimalist', 'survival'],
        ),
        SiteCardData(
          title: 'level devil',
          description: 'a side-scrolling platformer that attempts to infuriate the player by throwing in tricks and traps',
          tags: ['side-scroller', 'platformer'],
        ),
        SiteCardData(
          title: 'idea games',
          description: 'a collection of mini games',
          tags: ['novelty'],
          url: 'https://www.ideagames.fun/',
        ),
        SiteCardData(
          title: 'anthropeum',
          description: 'ranked competition game where you are shown an artifact and have to guess its origin',
          tags: ['history', 'archaeology'],
          url: 'https://anthropeum.com/',
        ),
        SiteCardData(
          title: 'zanagrams',
          description: 'a daily word game where you connect letters to create words',
          tags: ['words', 'puzzle'],
          url: 'https://zanagrams.com/',
        ),
      ],
    );
  }
}
