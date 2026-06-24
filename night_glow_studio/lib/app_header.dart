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

  @override
  Size get preferredSize => Size.fromHeight(subtitle == null ? kToolbarHeight : kToolbarHeight + 18);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;
    return AppBar(centerTitle: isMobile, automaticallyImplyLeading: false,
    backgroundColor: transparent ? Colors.transparent : null,
    elevation: transparent ? 0 : null,
    title: MouseRegion(cursor: SystemMouseCursors.click,
    child: GestureDetector(onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
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
    actions: showActions ? [
      GlowOnHover(child: TextButton(onPressed: () => Navigator.pushNamed(context, '/words'),
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      child: const Text('words'),
      )),
      const SizedBox(width: 8),
      GlowOnHover(child: TextButton(onPressed: () => Navigator.pushNamed(context, '/music'),
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      child: const Text('music'),
      )),
      const SizedBox(width: 8),
      GlowOnHover(child: TextButton(onPressed: () => Navigator.pushNamed(context, '/about'),
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      child: const Text('about'),
      )),
      const SizedBox(width: 8),
    ] : null
    );
  }
}