import 'package:flutter/material.dart';

class NsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NsAppBar({super.key, this.showActions = true});

  final bool showActions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(centerTitle: false, automaticallyImplyLeading: false, title: MouseRegion(cursor: SystemMouseCursors.click,
    child: GestureDetector(onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
    child: const Text('broken curfew studio'),
    ),
    ),
    actions: showActions ? [
      TextButton(onPressed: () => Navigator.pushNamed(context, '/words'),
      child: const Text('words'),
      ),
      const SizedBox(width: 8),
      TextButton(onPressed: () => Navigator.pushNamed(context, '/music'),
      child: const Text('music'),
      ),
      const SizedBox(width: 8),
      TextButton(onPressed: () => Navigator.pushNamed(context, '/about'),
      child: const Text('about'),
      ),
      const SizedBox(width: 8),
    ] : null
    );
  }
}