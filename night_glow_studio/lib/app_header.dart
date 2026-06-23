import 'package:flutter/material.dart';

class NsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NsAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(centerTitle: false, automaticallyImplyLeading: false, title: GestureDetector(onTap: () => Navigator.popUntil(context, (route) => route.isFirst),
    child: const Text('night glow studio'),
    ),
    actions: [
      TextButton(onPressed: () => Navigator.pushNamed(context, '/about'),
      child: const Text('book nook'),
      ),
      TextButton(onPressed: () => Navigator.pushNamed(context, '/about'),
      child: const Text('studio'),
      ),
      const SizedBox(width: 8),
      TextButton(onPressed: () => Navigator.pushNamed(context, '/about'),
      child: const Text('about'),
      ),
      const SizedBox(width: 8),
    ]
    );
  }
}