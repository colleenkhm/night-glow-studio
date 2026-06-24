import 'package:flutter/material.dart';
import 'hover_glow.dart';

class NsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NsAppBar({super.key, this.showActions = true, this.subtitle});

  final bool showActions;
  final String? subtitle;

  @override
  Size get preferredSize => Size.fromHeight(subtitle == null ? kToolbarHeight : kToolbarHeight + 18);

  @override
  Widget build(BuildContext context) {
    return AppBar(centerTitle: false, automaticallyImplyLeading: false, title: GlowOnHover(child: MouseRegion(cursor: SystemMouseCursors.click,
    child: GestureDetector(onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('broken curfew studio'),
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
    )),
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