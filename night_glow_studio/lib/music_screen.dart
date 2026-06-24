import 'package:flutter/material.dart';
import 'site_hub_screen.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteHubScreen(
      cards: [
        SiteCardData(
          title: 'geoguessr',
          description: 'drops you into a random Street View location and challenges you to guess where in the world you are',
          tags: ['geography', 'games'],
          url: 'https://www.geoguessr.com/',
        ),
        SiteCardData(
          title: 'worldle',
          description: 'a daily guessing game where you identify a country from its silhouette',
          tags: ['geography', 'games'],
          url: 'https://worldle.teuteuf.fr/',
        ),
        SiteCardData(
          title: 'radio garden',
          description: 'spin a virtual globe and tune into live radio stations from cities around the world',
          tags: ['radio', 'world'],
          url: 'https://radio.garden/',
        ),
        SiteCardData(
          title: 'language guesser',
          description: 'plays a short music video clip and challenges you to guess what language is being spoken',
          tags: ['games', 'languages'],
          url: 'https://languageguesser.com/en',
        ),
      ],
    );
  }
}
