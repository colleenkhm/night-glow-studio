import 'package:flutter/material.dart';
import 'app_footer.dart';
import 'app_header.dart';
import 'starfield.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;
    const text = Padding(
      padding: EdgeInsets.all(24),
      child: Text('a toolkit for creatives, a portal for explorers, and an arcade for achievers. inspired by many late nights in high school and college'),
    );
    // Mobile scrolls the footer along with the text instead of pinning it to
    // the screen bottom - same Center wrapper as before either way, so
    // horizontal centering is unaffected. See the same change on
    // SiteHubScreen. showAbout is off since this link would point back at
    // the page you're already on.
    //
    // Starfield lives behind the whole Scaffold, same as SiteHubScreen/Home.
    // This page has no ground-level art of its own to leave room for, so it
    // uses the painter's default maxDy and gets the full screen.
    return Stack(
      children: [
        const Positioned.fill(child: CustomPaint(painter: StarfieldPainter())),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const NsAppBar(transparent: true),
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: isMobile
                        ? const SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                text,
                                NsFooter(showAbout: false),
                              ],
                            ),
                          )
                        : text,
                  ),
                ),
                if (!isMobile) const NsFooter(showAbout: false),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
