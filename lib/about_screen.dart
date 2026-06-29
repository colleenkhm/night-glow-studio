import 'package:flutter/material.dart';
import 'app_footer.dart';
import 'app_header.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;
    const text = Padding(
      padding: EdgeInsets.all(24),
      child: Text('a toolkit for creatives, a portal for explorers, and an arcade for procrastinators. inspired by many late nights in high school and college'),
    );
    // Mobile scrolls the footer along with the text instead of pinning it to
    // the screen bottom - same Center wrapper as before either way, so
    // horizontal centering is unaffected. See the same change on
    // SiteHubScreen. showAbout is off since this link would point back at
    // the page you're already on.
    return Scaffold(
      appBar: const NsAppBar(),
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
    );
  }
}
