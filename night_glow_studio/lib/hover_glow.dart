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
      // blurRadius is kept constant and only the color's opacity animates - toggling
      // boxShadow between [] and [shadow] makes Flutter lerp from a "zero" shadow,
      // which animates blurRadius from 0 too, flashing a sharp-edged solid rectangle
      // before it has time to diffuse into a soft glow.
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 200),
        tween: Tween<double>(end: _hovering ? 0.35 : 0),
        builder: (context, opacity, child) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.amber.withValues(alpha: opacity), blurRadius: 18)],
            ),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
