import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_footer.dart';
import 'app_header.dart';
import 'hover_glow.dart';
import 'site_data.dart';
import 'site_hub_screen.dart';
import 'starfield.dart';

// Cards without a url aren't launchable, so they're excluded from the pool
// up front - keeps _roll simple and the tag list limited to tags that can
// actually produce a result.
final List<SiteCardData> _rollableCards = [for (final card in allSiteCards) if (card.url != null) card];

// Pick-a-tag, hit roll, get a random site from studio/library/arcade combined.
// Reachable from any page via the dice icon in NsAppBar (see app_header.dart).
class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  final Set<String> _selectedTags = {};
  final Random _random = Random();
  SiteCardData? _result;
  // Closed by default - with ~60 tags across all three hubs, an open chip
  // cloud pushes the roll button and result well below the fold, making a
  // roll look like it did nothing when it's really just off-screen. Mirrors
  // the filter toggle on the hub pages (see site_hub_screen.dart).
  bool _tagsOpen = false;

  void _toggleTag(String tag) {
    setState(() {
      if (!_selectedTags.remove(tag)) _selectedTags.add(tag);
    });
  }

  void _toggleTagsOpen() => setState(() => _tagsOpen = !_tagsOpen);

  void _roll() {
    final pool = _selectedTags.isEmpty
        ? _rollableCards
        : [
            for (final card in _rollableCards)
              if (card.tags.any(_selectedTags.contains)) card,
          ];
    if (pool.isEmpty) {
      setState(() => _result = null);
      return;
    }
    // Reroll if we land on the same card twice in a row (when there's
    // another option) so mashing the button doesn't feel stuck.
    var pick = pool[_random.nextInt(pool.length)];
    while (pool.length > 1 && pick == _result) {
      pick = pool[_random.nextInt(pool.length)];
    }
    setState(() => _result = pick);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;
    final allTags = {for (final card in _rollableCards) ...card.tags}.toList()..sort();

    return Stack(
      children: [
        const Positioned.fill(child: CustomPaint(painter: StarfieldPainter())),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const NsAppBar(transparent: true, subtitle: 'surprise me'),
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isMobile) const NsMobileSubheader(subtitle: 'surprise me', showLinks: true),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 480),
                            child: Text(
                              'roll for a random site',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
                            ),
                          ),
                          const SizedBox(height: 24),
                          _RollButton(rolled: _result != null, onTap: _roll),
                          const SizedBox(height: 32),
                          if (_result != null)
                            _ResultCard(card: _result!)
                          else
                            Text('nothing rolled yet', style: TextStyle(color: Colors.white.withValues(alpha: 0.4))),
                          const SizedBox(height: 32),
                          _TagsToggle(open: _tagsOpen, activeCount: _selectedTags.length, onTap: _toggleTagsOpen),
                          if (_tagsOpen)
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 560),
                                child: Wrap(
                                  alignment: WrapAlignment.center,
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    for (final tag in allTags)
                                      _TagChip(tag: tag, selected: _selectedTags.contains(tag), onTap: () => _toggleTag(tag)),
                                  ],
                                ),
                              ),
                            ),
                          if (isMobile) const NsFooter(),
                        ],
                      ),
                    ),
                  ),
                ),
                if (!isMobile) const Padding(padding: EdgeInsets.only(bottom: 16), child: NsFooter()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Toggle for the collapsible tag panel - styled and glowed like the filter
// toggle on the hub pages (see _FilterToggle in site_hub_screen.dart), kept
// closed by default so the roll button stays close to the top of the page.
class _TagsToggle extends StatelessWidget {
  const _TagsToggle({required this.open, required this.activeCount, required this.onTap});

  final bool open;
  final int activeCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GlowOnHover(
      active: open,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TextButton.icon(
          onPressed: onTap,
          style: TextButton.styleFrom(overlayColor: Colors.transparent, foregroundColor: Colors.amber),
          icon: const Icon(Icons.tune, size: 16),
          label: Text(activeCount == 0 ? 'tags' : 'tags ($activeCount)'),
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.tag, required this.selected, required this.onTap});

  final String tag;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GlowOnHover(
      active: selected,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: selected ? Colors.amber.withValues(alpha: 0.2) : const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber.withValues(alpha: selected ? 0.9 : 0.3)),
            ),
            child: Text(tag, style: TextStyle(color: selected ? Colors.amber : Colors.white70, fontSize: 13)),
          ),
        ),
      ),
    );
  }
}

class _RollButton extends StatefulWidget {
  const _RollButton({required this.rolled, required this.onTap});

  final bool rolled;
  final VoidCallback onTap;

  @override
  State<_RollButton> createState() => _RollButtonState();
}

class _RollButtonState extends State<_RollButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: _hovering ? const Color(0xFF3A3624) : const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.amber.withValues(alpha: _hovering ? 0.9 : 0.5)),
            boxShadow: _hovering
                ? [BoxShadow(color: Colors.amber.withValues(alpha: 0.3), blurRadius: 20, spreadRadius: 1)]
                : const [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.casino, color: Colors.amber, size: 18),
              const SizedBox(width: 10),
              Text(
                widget.rolled ? 'reroll' : 'roll',
                style: const TextStyle(color: Colors.amber, fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultCard extends StatefulWidget {
  const _ResultCard({required this.card});

  final SiteCardData card;

  @override
  State<_ResultCard> createState() => _ResultCardState();
}

class _ResultCardState extends State<_ResultCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final card = widget.card;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(card.url!), webOnlyWindowName: '_blank'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 320,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _hovering ? const Color(0xFF3A3624) : const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.amber.withValues(alpha: _hovering ? 0.9 : 0.4)),
            boxShadow: _hovering
                ? [BoxShadow(color: Colors.amber.withValues(alpha: 0.3), blurRadius: 24, spreadRadius: 1)]
                : const [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(card.title, style: const TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Text(card.description, style: const TextStyle(color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 14),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final tag in card.tags)
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
            ],
          ),
        ),
      ),
    );
  }
}
