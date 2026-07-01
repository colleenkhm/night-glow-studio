import 'package:flutter/material.dart';
import 'site_hub_screen.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteHubScreen(
      cards: [
        SiteCardData(
          title: 'scaler',
          description: 'a tool to help musicians discover what scale a song could be in',
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
          title: 'sandboxels',
          description: 'a falling-sand physics sandbox with hundreds of elements that react, burn, and combine',
          tags: ['sandbox', 'simulation'],
          url: 'https://neal.fun/sandboxels/',
        ),
        SiteCardData(
          title: 'cook',
          description: 'a sandbox for chopping, mixing, and cooking up whatever dish you can imagine',
          tags: ['sandbox', 'cooking'],
          url: 'https://r74n.com/cook/',
        ),
        SiteCardData(
          title: 'zen garden',
          description: 'a relaxing digital zen garden you can rake and rearrange with your cursor',
          tags: ['relaxation', 'sandbox'],
          url: 'https://paint.toys/zen-garden/',
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
          title: 'particle garden',
          description: 'a falling-particle sandbox where you paint with elements and watch them react and interact',
          tags: ['sandbox', 'simulation'],
          url: 'https://www.particlegarden.com/',
        ),
      ],
    );
  }
}
