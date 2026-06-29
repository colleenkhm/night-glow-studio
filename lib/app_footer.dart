import 'package:flutter/material.dart';

// Attribution line, shown at the bottom of every page.
class NsFooter extends StatelessWidget {
  const NsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        'a Flutter/Dart project by Colleen Murray',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
        ),
      ),
    );
  }
}
