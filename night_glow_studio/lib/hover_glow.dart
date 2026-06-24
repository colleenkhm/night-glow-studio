import 'package:flutter/material.dart';

class GlowOnHover extends StatefulWidget {
  const GlowOnHover({super.key, required this.child});

  final Widget child;

  @override
  State<GlowOnHover> createState() => _GlowOnHoverState();
}

class _GlowOnHoverState extends State<GlowOnHover> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          boxShadow: _hovering
              ? [BoxShadow(color: Colors.amber.withValues(alpha: 0.35), blurRadius: 18)]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
