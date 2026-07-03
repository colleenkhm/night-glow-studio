import 'package:flutter/material.dart';

// Shown at the bottom of every page.
class NsFooter extends StatelessWidget {
  const NsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        'a toolkit for creatives, a portal for explorers, and an arcade for achievers. inspired by many late nights in high school and college',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
        ),
      ),
    );
  }
}
