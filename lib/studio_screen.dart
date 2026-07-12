import 'package:flutter/material.dart';
import 'site_hub_screen.dart';

class StudioScreen extends StatelessWidget {
  const StudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteHubScreen(
      cards: [
        SiteCardData(
          title: 'scaler',
          description: 'a tool to help musicians discover what key a song could be in',
          tags: ['music'],
          url: 'https://colleenkhm.github.io/scaler/',
        ),
        SiteCardData(
          title: 'just a word',
          description: 'a simple resource for looking up words',
          tags: ['words', 'writing'],
          url: 'https://www.just-a-word.com/',
        ),
        SiteCardData(
          title: 'freeCodeCamp',
          description: 'a non-profit resource with self-paced coding tutorials that walk you through building real projects',
          tags: ['code', 'learning'],
          url: 'https://www.freecodecamp.org/',
        ),
        SiteCardData(
          title: 'coolors',
          description: 'a color palette generator for finding and fine-tuning color schemes',
          tags: ['design', 'color'],
          url: 'https://coolors.co/',
        ),
        SiteCardData(
          title: 'inkarnate',
          description: 'a fantasy map-making tool for building worlds for stories, games, and campaigns',
          tags: ['design', 'worldbuilding'],
          url: 'https://inkarnate.com/',
        ),
        SiteCardData(
          title: 'rooms.xyz',
          description: 'a tool for designing and decorating virtual rooms with real furniture and decor',
          tags: ['design', 'interior'],
          url: 'https://rooms.xyz/',
        ),
        SiteCardData(
          title: 'anime.js',
          description: 'a lightweight JavaScript animation library for building smooth, complex web animations',
          tags: ['code', 'animation'],
          url: 'https://animejs.com/',
        ),
        SiteCardData(
          title: 'bandlab',
          description: 'a free, cloud-based studio for recording, mixing, and collaborating on music online',
          tags: ['music', 'tool'],
          url: 'https://www.bandlab.com',
        ),
        SiteCardData(
          title: 'musicca tuner',
          description: 'a simple online tuner for getting your instrument in tune',
          tags: ['music', 'tool'],
          url: 'https://www.musicca.com/tuner',
        ),
        SiteCardData(
          title: 'tailornova',
          description: 'an online fashion design tool for visualizing garments in 3D and generating custom-fitted sewing patterns',
          tags: ['design', 'sewing'],
          url: 'https://tailornova.com/',
        ),
      ],
    );
  }
}
