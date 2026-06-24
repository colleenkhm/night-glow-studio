import 'dart:math';

import 'package:flutter/material.dart';

// A handful of small, dim, fixed-position dots scattered across the background
// to read as a night sky. Seeded per-star so positions are stable across rebuilds.
class StarfieldPainter extends CustomPainter {
  const StarfieldPainter({this.maxDy = 1.0});

  // Caps how far down the stars extend, as a fraction of the canvas height -
  // useful for pages with their own ground-level art that stars shouldn't
  // overlap. dy is generated in [0,1] and scaled by maxDy at paint time, so
  // the same star positions work for any maxDy.
  final double maxDy;

  static final List<Star> _stars = List.generate(60, (i) {
    final random = Random(i);
    return Star(
      dx: random.nextDouble(),
      dy: random.nextDouble(),
      radius: 0.5 + random.nextDouble() * 1.2,
      opacity: 0.2 + random.nextDouble() * 0.5,
    );
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in _stars) {
      canvas.drawCircle(
        Offset(star.dx * size.width, star.dy * maxDy * size.height),
        star.radius,
        Paint()..color = Colors.white.withValues(alpha: star.opacity),
      );
    }
  }

  @override
  bool shouldRepaint(covariant StarfieldPainter oldDelegate) => oldDelegate.maxDy != maxDy;
}

class Star {
  const Star({required this.dx, required this.dy, required this.radius, required this.opacity});

  final double dx;
  final double dy;
  final double radius;
  final double opacity;
}
