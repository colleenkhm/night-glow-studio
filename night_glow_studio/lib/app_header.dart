import 'package:flutter/material.dart';
import 'hover_glow.dart';

class NsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NsAppBar({super.key, this.showActions = true, this.subtitle, this.transparent = false});

  final bool showActions;
  final String? subtitle;
  // For pages (like Home) that draw their own full-screen background (e.g. a
  // starfield) behind the AppBar via Scaffold's extendBodyBehindAppBar, so the
  // background reads as continuous instead of cutting off at the AppBar.
  final bool transparent;

  static const labels = ['create', 'travel', 'procrastinate'];
  static const routes = ['/tools', '/atlas', '/arcade'];

  static List<Widget> actionButtons(BuildContext context) => [
        for (var i = 0; i < labels.length; i++)
          GlowOnHover(
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, routes[i]),
              style: TextButton.styleFrom(overlayColor: Colors.transparent),
              child: Text(labels[i]),
            ),
          ),
      ];

  // Shown everywhere the hub links are, plus Home (which hides those via
  // showActions/showLinks since its lamp scene has its own inline links) -
  // this is the one consistent way back to the about page from any screen.
  static Widget aboutButton(BuildContext context) => GlowOnHover(
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, '/about'),
          style: TextButton.styleFrom(overlayColor: Colors.transparent),
          child: Text(
            'about',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      );

  // Mobile keeps this AppBar down to just the title - subtitle and nav links
  // render as normal body content instead (see NsMobileSubheader), since
  // trying to fit variable-height extras into the AppBar's title slot kept
  // causing clipping that was fragile to get right across devices. Desktop/
  // tablet keep the richer title (with subtitle) and actions, which haven't
  // had that problem.
  @override
  Size get preferredSize {
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    final isMobile = (view.physicalSize.width / view.devicePixelRatio) < 600;
    return Size.fromHeight(kToolbarHeight + (!isMobile && subtitle != null ? 18 : 0));
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;
    return AppBar(centerTitle: isMobile, automaticallyImplyLeading: false,
    backgroundColor: transparent ? Colors.transparent : null,
    elevation: transparent ? 0 : null,
    title: MouseRegion(cursor: SystemMouseCursors.click,
    child: GestureDetector(onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
    child: isMobile
        ? GlowOnHover(child: const Text('broken curfew studio'))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GlowOnHover(child: const Text('broken curfew studio')),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
            ],
          ),
    ),
    ),
    actions: isMobile
        ? null
        : [
            if (showActions) for (final button in actionButtons(context)) ...[button, const SizedBox(width: 8)],
            aboutButton(context),
            const SizedBox(width: 16),
          ],
    );
  }
}

// Shown at the top of the body, mobile only, in place of what the AppBar
// shows on desktop/tablet (subtitle and/or nav links) - normal body content
// sizes itself naturally, unlike the AppBar's title slot.
class NsMobileSubheader extends StatelessWidget {
  const NsMobileSubheader({super.key, this.subtitle, this.showLinks = false});

  final String? subtitle;
  final bool showLinks;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (subtitle != null)
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          // Only shown alongside the main hub links - on its own (e.g. Home,
          // which has no showLinks) it ends up looking like an orphaned,
          // out-of-place link right under the subtitle.
          if (showLinks)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                children: [...NsAppBar.actionButtons(context), NsAppBar.aboutButton(context)],
              ),
            ),
        ],
      ),
    );
  }
}
