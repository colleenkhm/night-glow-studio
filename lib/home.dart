import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'app_footer.dart';
import 'app_header.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Index of the nav link currently hovered: 0 = words, 1 = music, 2 = about, null = none.
  int? _hoveredLink;

  // Lamp tilt per link, in turns (1 turn = 360deg). Pivot is the lamp's top-center.
  // The fixed pivot sits toward the left of the row, so all three links now need
  // a rightward (negative) tilt of varying degree rather than a symmetric swing.
  // Capped at a natural-looking angle - the beam's own reach covers the rest.
  static const List<double> _tiltTurns = [-0.00, -0.10, -0.15]; // -7.2deg, -32.4deg, -46.8deg

  // Beam length per link, in px. A fixed-length beam rotated by more covers less
  // vertical distance per unit length (more of it goes sideways), so it needs to
  // get longer as the tilt increases to still land exactly on the ground line
  // instead of overshooting past it.
  static const List<double> _beamHeights = [175, 209, 310];

  // Arm is rooted at the pole top and is a fixed length/angle - it doesn't slide
  // or stretch per link. Only the head tilts (see _tiltTurns) and the beam glows
  // toward whichever link is hovered.
  static const double _armPivotX = 17;
  static const double _armPivotY = -20;
  static const double _armLength = 55;
  static const double _armAngle = -0.3;

  // Head sits at the arm's tip, accounting for the wedge being centered within
  // the head's 90-wide SizedBox (see the head's child Column below).
  static const double _headLeft = 45;
  static const double _headTop = -36;

  // Same three links/routes the lamp scene uses below, indexed the same way, so
  // _hoveredLink/_setHovered work for both the lamp (tablet/desktop) and the
  // traffic light (mobile) without duplicating state.
  static const List<String> _routes = ['/explore', '/create', '/arcade'];
  static const List<Color> _lightColors = [Colors.green, Colors.amber, Colors.red];
  // Stacked as two lines per bulb - fits the circular shape better than a
  // single wrapped phrase would.
  static const List<List<String>> _lightLabels = [
    ['go', 'somewhere'],
    ['make', 'something'],
    ['kill', 'time'],
  ];

  void _setHovered(int? index) => setState(() => _hoveredLink = index);

  // Mobile gets a traffic light instead of the lamp - that layout favors wide
  // screens, and a vertical street light reads better on a tall phone screen.
  // Same theme (street furniture, colored glow), same links/routes underneath.
  // Plain top-down flow (no Align/topClearance trick) since the caller now
  // puts this in a SingleChildScrollView - fixed-height layout here was what
  // kept causing bottom overflow on shorter phones.
  Widget _buildTrafficLight() {
    // The AppBar is transparent and the body extends behind it (so the
    // starfield reads as continuous), which means this needs its own top
    // clearance for the AppBar's height plus the status bar inset. On mobile
    // the AppBar is just the bare title (no +18 for a subtitle - see
    // NsAppBar/NsMobileSubheader), so this only needs kToolbarHeight itself.
    final topClearance = MediaQuery.of(context).padding.top + kToolbarHeight + 4;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: topClearance),
        const NsMobileSubheader(subtitle: 'for the curious and the restless'),
        Container(
          width: 250,
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(48),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var i = 2; i >= 0; i--) ...[
                if (i != 2) const SizedBox(height: 28),
                _trafficLightBulb(i),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _trafficLightBulb(int index) {
    final active = _hoveredLink == index;
    final color = _lightColors[index];
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHovered(index),
      onExit: (_) => _setHovered(null),
      child: GestureDetector(
        onTapDown: (_) => _setHovered(index),
        onTapCancel: () => _setHovered(null),
        onTapUp: (_) => _setHovered(null),
        onTap: () => Navigator.pushNamed(context, _routes[index]),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 160,
          height: 160,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: active ? color : color.withValues(alpha: 0.25),
            boxShadow: active
                ? [BoxShadow(color: color.withValues(alpha: 0.7), blurRadius: 28, spreadRadius: 3)]
                : [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final word in _lightLabels[index])
                Text(
                  word,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w600),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const NsAppBar(showActions: false, subtitle: 'for the curious and the restless', transparent: true),
      body: LayoutBuilder(
        builder: (context, outerConstraints) {
          // Mobile has no road line, so the starfield can use the full screen
          // instead of being capped to leave room for it.
          final isMobile = outerConstraints.maxWidth < 600;
          return Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _StarfieldPainter(maxDy: isMobile ? 1.0 : 0.62))),
          // Desktop already gets an about link in the AppBar's top-right -
          // mobile doesn't (see NsMobileSubheader), so it rides along with
          // the footer here instead of being added a second time up top.
          if (isMobile)
            // Scrollable so this can never overflow, regardless of viewport
            // height or how much content (traffic light + about + footer)
            // there is - mirrors the fix already used for the hub pages,
            // instead of continuing to hand-tune fixed heights/padding here.
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildTrafficLight(),
                    const SizedBox(height: 32),
                    NsAppBar.aboutButton(context),
                    const NsFooter(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            )
          else ...[
            const Positioned(left: 0, right: 0, bottom: 4, child: NsFooter()),
            Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Bigger breakpoints get a smaller fraction since the screen itself
            // is already larger - keeps the composition prominent at every size
            // without it becoming oversized on wide desktop windows.
            final double widthFraction = constraints.maxWidth < 1024 ? 0.8 : 0.65;
            // The beam below is rotated as a rigid trapezoid along with the lamp
            // head, so a bottom edge that's flat in the beam's own local space
            // ends up tilted on screen once rotated - leaving a wedge of unlit
            // gap between the beam and the (always-horizontal) ground line.
            // beamTilt is that same rotation, in radians; the clipper below
            // counter-rotates the edge by it so it renders horizontal on screen
            // regardless of which link is hovered.
            final double beamTilt = _hoveredLink == null ? 0 : _tiltTurns[_hoveredLink!] * 2 * pi;
            // The blur bleeds past the beam's hard edge in whatever direction is
            // "down" in the beam's own pre-rotation space - for the straight-down
            // beam (no tilt) that's also screen-down, so it already glows past the
            // ground line for free. Once rotated, that same bleed points off at an
            // angle instead, so tilted beams need this bit of extra reach (carried
            // through the same counter-rotation as the rest of the edge) to glow
            // past the road by the same amount the untilted beam gets for free.
            final double beamRoadOverlap = beamTilt == 0 ? 0 : 18;
            final double beamReach = (_hoveredLink == null ? 175 : _beamHeights[_hoveredLink!]) + beamRoadOverlap;
            final double beamWidth = _hoveredLink == null ? 12 : 220;
            // Counter-rotating the edge swings one corner below beamReach - grow
            // the box to fit it (the other corner ends up short of the box, which
            // is fine; clipping just leaves it blank there).
            final double beamBoxHeight = beamReach + (beamWidth / 2) * tan(beamTilt).abs();
            return SizedBox(
              width: constraints.maxWidth * widthFraction,
              height: constraints.maxHeight * 0.9,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Transform.translate(
                  // The lamp's own translate (below) shifts its rendered pixels right
                  // without widening its reserved layout space, so Center ends up
                  // centering a box that's mostly blank on the left. Compensate here.
                  offset: const Offset(-15, 0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Row(
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
                    left: _armPivotX,
                    top: _armPivotY,
                    child: Container(width: 6, height: 182, color: const Color(0xFF333333)),
                  ),
                  // fixed arm - a short jut near the top of the pole. Doesn't move;
                  // only the head tilts and the beam glows toward the hovered link.
                  Positioned(
                    left: _armPivotX,
                    top: _armPivotY,
                    child: Transform.rotate(
                      angle: _armAngle,
                      alignment: Alignment.topLeft,
                      child: Container(width: _armLength, height: 5, color: const Color(0xFF333333)),
                    ),
                  ),
                  // small fill at the arm/head joint - rotating the head opens a gap
                  // there since the arm itself doesn't rotate with it. Static, sitting
                  // behind the head so it's covered at small tilts and only shows
                  // through at larger ones, where it reads as a filled joint rather
                  // than empty space. A circle has no specific angle to get wrong.
                  Positioned(
                    left: 69,
                    top: -36,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF333333)),
                    ),
                  ),
                  // head - fixed at the arm's tip, tilts toward the hovered link.
                  Positioned(
                    left: _headLeft,
                    top: _headTop,
                    child: AnimatedRotation(
                      turns: _hoveredLink == null ? 0 : _tiltTurns[_hoveredLink!],
                      // The wedge (40 wide) is centered in this 90-wide box, so its back
                      // corner - where it touches the arm - sits at local x=25, not at the
                      // box's center. Rotating around topCenter swung it away from the arm
                      // on any non-zero tilt; this targets the wedge's actual corner instead.
                      alignment: const Alignment(-0.4444, -1.0),
                      duration: const Duration(milliseconds: 200),
                      child: SizedBox(
                        // Fixed width so the beam widening on hover doesn't recenter the
                        // column and shift the housing sideways.
                        width: 90,
                        child: Column(
                        // Placeholder street lamp head - swap for real art anchored at its top-center.
                        children: [
                          // lamp head - a flattened wedge rather than a boxy lantern,
                          // with the light as a thin strip along its underside.
                          ClipPath(
                            clipper: _LampHeadClipper(),
                            child: Container(width: 40, height: 22, color: const Color(0xFF333333)),
                          ),
                          Container(
                            width: 32,
                            height: 3,
                            margin: const EdgeInsets.only(top: 1),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              boxShadow: [BoxShadow(color: Colors.amber.withValues(alpha: 0.6), blurRadius: 8)],
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
                              width: beamWidth,
                              height: beamBoxHeight,
                              child: ImageFiltered(
                                imageFilter: ui.ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                                child: ClipPath(
                                clipper: _BeamClipper(reach: beamReach, tiltRadians: beamTilt),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber.withValues(alpha: 0.6),
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
            // Hover-out only lives on the outer region, not the individual
            // buttons below - moving the mouse directly from one link to the
            // next would otherwise hit the gap between them and briefly clear
            // _hoveredLink, making the beam flicker off and back on instead of
            // sweeping continuously from one link to the other.
            MouseRegion(
              onExit: (_) => _setHovered(null),
              child: Wrap(children: [
                MouseRegion(
                  onEnter: (_) => _setHovered(0),
                  child: TextButton(onPressed: () => Navigator.pushNamed(context, '/create'),
                  style: TextButton.styleFrom(overlayColor: Colors.transparent),
                  child: const Text('make something', style: TextStyle(fontSize: 13)),
                  ),
                ),
                const SizedBox(width: 8),
                MouseRegion(
                  onEnter: (_) => _setHovered(1),
                  child: TextButton(onPressed: () => Navigator.pushNamed(context, '/explore'),
                  style: TextButton.styleFrom(overlayColor: Colors.transparent),
                  child: const Text('go somewhere', style: TextStyle(fontSize: 13)),
                  ),
                ),
                const SizedBox(width: 8),
                MouseRegion(
                  onEnter: (_) => _setHovered(2),
                  child: TextButton(onPressed: () => Navigator.pushNamed(context, '/arcade'),
                  style: TextButton.styleFrom(overlayColor: Colors.transparent),
                  child: const Text('kill time', style: TextStyle(fontSize: 13)),
                  ),
                ),
                const SizedBox(width: 8),
              ]),
            ),
          ],
                      ),
                      // ground line - sits at the pole/beam baseline, hinting at a sidewalk.
                      Positioned(
                        left: -40,
                        right: -40,
                        bottom: -4,
                        child: Container(height: 1.5, color: Colors.white.withValues(alpha: 0.12)),
                      ),
                      // parked car, to the left of the lamppost.
                      Positioned(
                        left: 20,
                        bottom: -4,
                        child: SizedBox(
                          width: 90,
                          height: 36,
                          child: CustomPaint(painter: _CarPainter()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
          ],
        ],
      );
        },
      ),
    );
  }
}

// A handful of small, dim, fixed-position dots scattered across the background
// to read as a night sky. Seeded per-star so positions are stable across rebuilds.
class _StarfieldPainter extends CustomPainter {
  const _StarfieldPainter({this.maxDy = 0.62});

  // The starfield is a separate full-screen layer behind the lamp scene's own
  // nested transforms, so it has no exact reading on where the road line lands.
  // Capping dy keeps stars out of roughly where the road has shown up - mobile
  // has no road, so it passes 1.0 to use the full screen. dy is generated in
  // [0,1] and scaled by maxDy at paint time, so the same star positions work
  // for either case.
  final double maxDy;

  static final List<_Star> _stars = List.generate(60, (i) {
    final random = Random(i);
    return _Star(
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
  bool shouldRepaint(covariant _StarfieldPainter oldDelegate) => oldDelegate.maxDy != maxDy;
}

// Simple parked-car silhouette: a body with a raised cabin, two wheels, and a
// tiny taillight for a bit of life along the road line.
class _CarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final body = Path()
      ..moveTo(0, size.height * 0.55)
      ..lineTo(size.width * 0.15, size.height * 0.55)
      ..lineTo(size.width * 0.3, size.height * 0.05)
      ..lineTo(size.width * 0.7, size.height * 0.05)
      ..lineTo(size.width * 0.85, size.height * 0.55)
      ..lineTo(size.width, size.height * 0.55)
      ..lineTo(size.width, size.height * 0.85)
      ..lineTo(0, size.height * 0.85)
      ..close();
    canvas.drawPath(body, Paint()..color = const Color(0xFF2A2A2A));

    final wheelRadius = size.height * 0.24;
    final wheelPaint = Paint()..color = const Color(0xFF1A1A1A);
    canvas.drawCircle(Offset(size.width * 0.22, size.height * 0.85), wheelRadius, wheelPaint);
    canvas.drawCircle(Offset(size.width * 0.78, size.height * 0.85), wheelRadius, wheelPaint);

    canvas.drawCircle(
      Offset(size.width * 0.04, size.height * 0.68),
      size.height * 0.08,
      Paint()..color = Colors.redAccent.withValues(alpha: 0.7),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _Star {
  const _Star({required this.dx, required this.dy, required this.radius, required this.opacity});

  final double dx;
  final double dy;
  final double radius;
  final double opacity;
}

// Flattened wedge for the lamp head: tall at the back (near the arm), tapering
// down toward the front, like a modern street-lamp fixture. Bottom edge stays
// flat so the light strip below it (in the Column) sits flush against it.
class _LampHeadClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, size.height * 0.4)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Clips the beam into a trapezoid: narrow at the bulb, wide at the bottom.
// The bottom edge is pre-tilted by -tiltRadians (pivoting around its
// midpoint, which stays at local y=reach) so that once the parent rotates
// the whole beam by tiltRadians to aim it at the hovered link, the two
// rotations cancel and the edge lands horizontal on screen - flat against
// the ground line - instead of tilting along with the beam.
class _BeamClipper extends CustomClipper<Path> {
  _BeamClipper({required this.reach, required this.tiltRadians});

  final double reach;
  final double tiltRadians;

  @override
  Path getClip(Size size) {
    const topWidth = 12.0;
    final halfDrop = (size.width / 2) * tan(tiltRadians);
    final leftBottom = reach + halfDrop;
    final rightBottom = reach - halfDrop;
    return Path()
      ..moveTo((size.width - topWidth) / 2, 0)
      ..lineTo((size.width + topWidth) / 2, 0)
      ..lineTo(size.width, rightBottom)
      ..lineTo(0, leftBottom)
      ..close();
  }

  @override
  bool shouldReclip(covariant _BeamClipper oldClipper) =>
      reach != oldClipper.reach || tiltRadians != oldClipper.tiltRadians;
}
