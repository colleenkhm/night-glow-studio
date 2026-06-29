import 'package:flutter/material.dart';
import 'app_header.dart';

// Attribution line, shown at the bottom of every page. On mobile it also
// carries the about link, on its own line below the attribution - desktop
// already shows that link in the AppBar, but mobile's AppBar is title-only
// (see NsAppBar), so the footer is its one consistent home there instead.
class NsFooter extends StatelessWidget {
  const NsFooter({super.key, this.showAbout = true});

  // False on the About page itself, where the link would just point back at
  // the page you're already on.
  final bool showAbout;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'a Flutter/Dart project by Colleen Murray',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
            ),
          ),
          if (isMobile && showAbout)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: NsAppBar.aboutButton(context),
            ),
        ],
      ),
    );
  }
}
