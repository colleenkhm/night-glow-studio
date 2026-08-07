import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_footer.dart';
import 'app_header.dart';
import 'hover_glow.dart';
import 'starfield.dart';

class SiteCardData {
  const SiteCardData({required this.title, required this.description, this.tags = const [], this.url});

  final String title;
  final String description;
  final List<String> tags;
  // Cards without a url just aren't clickable - for sites that don't exist yet.
  final String? url;
}

// Reusable hub layout: starfield background + a tag filter bar + a wrap of
// site cards. Each page (make something / go somewhere / kill time) reuses
// this, just passing a different list of cards.
class SiteHubScreen extends StatefulWidget {
  const SiteHubScreen({super.key, required this.cards});

  final List<SiteCardData> cards;

  @override
  State<SiteHubScreen> createState() => _SiteHubScreenState();
}

class _SiteHubScreenState extends State<SiteHubScreen> {
  final Set<String> _selectedTags = {};
  bool _filterOpen = false;

  void _toggleTag(String tag) {
    setState(() {
      if (!_selectedTags.remove(tag)) _selectedTags.add(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;
    final allTags = {for (final card in widget.cards) ...card.tags}.toList()..sort();
    final visibleCards = _selectedTags.isEmpty
        ? widget.cards
        : [
            for (final card in widget.cards)
              if (card.tags.any(_selectedTags.contains)) card,
          ];
    final panelOpen = _filterOpen && allTags.isNotEmpty;

    final cards = visibleCards.isEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Text(
              'no sites match the selected tags',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
            ),
          )
        : Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [for (final card in visibleCards) _SiteCard(card: card)],
          );

    // Mobile stacks the panel above the cards (a side-by-side row doesn't fit
    // a narrow screen); desktop/tablet puts it in a sidebar to the left so it
    // doesn't push the card grid down and out of view.
    final filterAndCards = isMobile
        ? Column(
            children: [
              if (allTags.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _FilterToggle(open: _filterOpen, activeCount: _selectedTags.length, onTap: _toggleFilterOpen),
                ),
              if (panelOpen)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _FilterPanel(tags: allTags, selected: _selectedTags, onToggle: _toggleTag),
                ),
              cards,
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Row must claim the full row width (not shrink to its content)
            // so the cards area below can Expanded into the remainder - that
            // keeps the panel pinned to a fixed left position regardless of
            // how few cards there are to wrap, instead of the whole row
            // shrinking to fit and getting re-centered by the parent.
            children: [
              if (panelOpen) ...[
                _FilterPanel(tags: allTags, selected: _selectedTags, onToggle: _toggleTag),
                const SizedBox(width: 24),
              ],
              Expanded(
                child: Column(
                  // start keeps the filter link pinned to the top-left corner
                  // of this area; the cards themselves are wrapped in a
                  // Center below since Wrap shrink-wraps to its content and
                  // would otherwise hug the left edge along with the link.
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (allTags.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: _FilterToggle(
                          open: _filterOpen,
                          activeCount: _selectedTags.length,
                          onTap: _toggleFilterOpen,
                        ),
                      ),
                    Center(child: cards),
                  ],
                ),
              ),
            ],
          );

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
            // Desktop keeps the footer outside the scrollable/centered area,
            // as its own fixed Column child, so it's anchored to the bottom
            // of the screen instead of getting vertically centered along
            // with the cards on pages that don't have enough of them to fill
            // the page. Mobile instead scrolls the footer along with the
            // cards (inside the same Center/SingleChildScrollView, so the
            // horizontal centering is unaffected) - pinning it there stole
            // space from the cards and felt disconnected from the page.
            body: Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          if (isMobile) const NsMobileSubheader(showLinks: true),
                          filterAndCards,
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

  void _toggleFilterOpen() => setState(() => _filterOpen = !_filterOpen);
}

// Link that shows/hides the tag filter panel - styled and glowed like the
// main nav links (see GlowOnHover), and stays lit while the panel is open so
// it doubles as a state indicator, not just a hover effect.
class _FilterToggle extends StatelessWidget {
  const _FilterToggle({required this.open, required this.activeCount, required this.onTap});

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
          label: Text(activeCount == 0 ? 'filter' : 'filter ($activeCount)'),
        ),
      ),
    );
  }
}

// Sidebar (desktop) / stacked panel (mobile) of tag checkboxes, shown when
// the filter toggle is open. Selecting one or more tags shows cards matching
// any of them (OR, not AND), since AND tends to zero out results fast with
// only a couple of tags per card.
class _FilterPanel extends StatelessWidget {
  const _FilterPanel({required this.tags, required this.selected, required this.onToggle});

  final List<String> tags;
  final Set<String> selected;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amber.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'tags',
            style: TextStyle(color: Colors.amber.withValues(alpha: 0.8), fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          for (final tag in tags) _FilterCheckbox(tag: tag, checked: selected.contains(tag), onTap: () => onToggle(tag)),
        ],
      ),
    );
  }
}

class _FilterCheckbox extends StatelessWidget {
  const _FilterCheckbox({required this.tag, required this.checked, required this.onTap});

  final String tag;
  final bool checked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GlowOnHover(
      active: checked,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  checked ? Icons.check_box : Icons.check_box_outline_blank,
                  size: 18,
                  color: checked ? Colors.amber : Colors.white54,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    tag,
                    style: TextStyle(color: checked ? Colors.amber : Colors.white70, fontSize: 13),
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 280,
          height: 170,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _hovering ? const Color(0xFF3A3624) : const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.amber.withValues(alpha: _hovering ? 0.9 : 0.3)),
            boxShadow: _hovering
                ? [BoxShadow(color: Colors.amber.withValues(alpha: 0.3), blurRadius: 20, spreadRadius: 1)]
                : const [],
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
                      for (final tag in widget.card.tags.take(3))
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
