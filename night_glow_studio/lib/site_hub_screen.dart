import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_footer.dart';
import 'app_header.dart';
import 'starfield.dart';

class SiteCardData {
  const SiteCardData({required this.title, required this.description, this.tags = const [], this.url});

  final String title;
  final String description;
  final List<String> tags;
  // Cards without a url just aren't clickable - for sites that don't exist yet.
  final String? url;
}

// Reusable hub layout: starfield background + a wrap of site cards. Each page
// (make something / go somewhere / kill time) reuses this, just passing a
// different list of cards.
class SiteHubScreen extends StatelessWidget {
  const SiteHubScreen({super.key, required this.cards});

  final List<SiteCardData> cards;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;
    // Starfield lives behind the whole Scaffold (not inside its body) so
    // Scaffold can position the body below the AppBar the normal, automatic
    // way - manually replicating that math (extendBodyBehindAppBar) was
    // fragile and kept causing spacing bugs. Same approach as Home.
    return Stack(
      children: [
        const Positioned.fill(child: CustomPaint(painter: StarfieldPainter())),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const NsAppBar(transparent: true),
            // Footer lives outside the scrollable/centered area, as its own
            // fixed Column child, so it's anchored to the bottom of the
            // screen instead of getting vertically centered along with the
            // cards on pages that don't have enough of them to fill the page.
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          if (isMobile) const NsMobileSubheader(showLinks: true),
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            children: [for (final card in cards) _SiteCard(card: card)],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const NsFooter(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SiteCard extends StatefulWidget {
  const _SiteCard({required this.card});

  final SiteCardData card;

  @override
  State<_SiteCard> createState() => _SiteCardState();
}

class _SiteCardState extends State<_SiteCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final url = widget.card.url;
    return MouseRegion(
      cursor: url == null ? MouseCursor.defer : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: url == null ? null : () => launchUrl(Uri.parse(url), webOnlyWindowName: '_blank'),
        child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: _hovering ? 1 : 0.75,
        child: Container(
          width: 280,
          height: 170,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.amber.withValues(alpha: 0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.card.title,
                style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  widget.card.description,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ),
              if (widget.card.tags.isNotEmpty)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Wrap(
                    spacing: 6,
                    children: [
                      for (final tag in widget.card.tags)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(tag, style: const TextStyle(color: Colors.amber, fontSize: 11)),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
