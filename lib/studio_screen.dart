import 'package:flutter/material.dart';
import 'site_data.dart';
import 'site_hub_screen.dart';

class StudioScreen extends StatelessWidget {
  const StudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteHubScreen(cards: studioCards);
  }
}
