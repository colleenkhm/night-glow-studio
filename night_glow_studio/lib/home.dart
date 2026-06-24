import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'app_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Index of the nav link currently hovered: 0 = words, 1 = music, 2 = about, null = none.
  int? _hoveredLink;

  // Lamp tilt per link, in turns (1 turn = 360deg). Pivot is the lamp's top-center,
  // so design the lamp/beam art with its mounting point at the top.
  static const List<double> _tiltTurns = [1 / 16, 0, -1 / 16]; // +22.5deg, 0deg, -22.5deg

  void _setHovered(int? index) => setState(() => _hoveredLink = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NsAppBar(showActions: false, subtitle: 'creative tools for the eleventh hour'),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Bigger breakpoints get a smaller fraction since the screen itself
            // is already larger - keeps the composition prominent at every size
            // without it becoming oversized on wide desktop windows.
            final double widthFraction = constraints.maxWidth < 600
                ? 0.92
                : constraints.maxWidth < 1024
                    ? 0.8
                    : 0.65;
            return SizedBox(
              width: constraints.maxWidth * widthFraction,
              height: constraints.maxHeight * 0.9,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Transform.translate(
                  // The lamp's own translate (below) shifts its rendered pixels right
                  // without widening its reserved layout space, so Center ends up
                  // centering a box that's mostly blank on the left. Compensate here.
                  offset: const Offset(-70, 0),
                  child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Transform.translate(
              offset: const Offset(120, -8),
              child: SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // fixed pole - stays put while the head above tilts toward the hovered link.
                  Positioned(
                    left: 17,
                    top: -20,
                    child: Container(width: 6, height: 170, color: const Color(0xFF333333)),
                  ),
                  // fixed arm - pinned at the pole top, swings out and up to the side.
                  Positioned(
                    left: 17,
                    top: -20,
                    child: Transform.rotate(
                      angle: -0.36,
                      alignment: Alignment.topLeft,
                      child: Container(width: 133, height: 5, color: const Color(0xFF333333)),
                    ),
                  ),
                  // head - offset to the side, at the end of the arm.
                  Positioned(
                    left: 97,
                    top: -67,
                    child: AnimatedRotation(
                      turns: _hoveredLink == null ? 0 : _tiltTurns[_hoveredLink!],
                      alignment: Alignment.topCenter,
                      duration: const Duration(milliseconds: 200),
                      child: SizedBox(
                        // Fixed width so the beam widening on hover doesn't recenter the
                        // column and shift the housing sideways.
                        width: 90,
                        child: Column(
                        // Placeholder street lamp head - swap for real art anchored at its top-center.
                        children: [
                          // lamp housing - one piece so it doesn't read as two
                          // disconnected shapes once tilted.
                          Container(
                            width: 32,
                            height: 34,
                            decoration: BoxDecoration(
                              color: const Color(0xFF333333),
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                              border: Border.all(color: Colors.amber.withValues(alpha: 0.4)),
                            ),
                          ),
                          AnimatedOpacity(
                            opacity: _hoveredLink == null ? 0 : 1,
                            duration: const Duration(milliseconds: 200),
                            // Placeholder beam - swap for real art, same top-center anchor.
                            // Flares wider and blurs into a soft glow on hover - this is now
                            // the only hover indicator on the links, so it reaches further.
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              width: _hoveredLink == null ? 12 : 110,
                              height: 195,
                              child: ImageFiltered(
                                imageFilter: ui.ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                                child: ClipPath(
                                clipper: _BeamClipper(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [Colors.amber.withValues(alpha: 0.7), Colors.amber.withValues(alpha: 0.4)],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ),
                        ],
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ),
            const SizedBox(width: 8),
            Wrap(children: [
              MouseRegion(
                onEnter: (_) => _setHovered(0),
                onExit: (_) => _setHovered(null),
                child: TextButton(onPressed: () => Navigator.pushNamed(context, '/words'),
                style: TextButton.styleFrom(overlayColor: Colors.transparent),
                child: const Text('words'),
                ),
              ),
              const SizedBox(width: 8),
              MouseRegion(
                onEnter: (_) => _setHovered(1),
                onExit: (_) => _setHovered(null),
                child: TextButton(onPressed: () => Navigator.pushNamed(context, '/music'),
                style: TextButton.styleFrom(overlayColor: Colors.transparent),
                child: const Text('music'),
                ),
              ),
              const SizedBox(width: 8),
              MouseRegion(
                onEnter: (_) => _setHovered(2),
                onExit: (_) => _setHovered(null),
                child: TextButton(onPressed: () => Navigator.pushNamed(context, '/about'),
                style: TextButton.styleFrom(overlayColor: Colors.transparent),
                child: const Text('about'),
                ),
              ),
              const SizedBox(width: 8),
            ]),
          ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Clips the beam into a trapezoid: narrow at the bulb, wide at the bottom.
class _BeamClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const topWidth = 12.0;
    return Path()
      ..moveTo((size.width - topWidth) / 2, 0)
      ..lineTo((size.width + topWidth) / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
