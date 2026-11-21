import 'package:material_ui/material_ui.dart';

/// Temporary vector artwork for the arena photos until the exported Figma
/// photography is added to assets/images/.
class PitchArtwork extends StatelessWidget {
  const PitchArtwork({super.key, this.height = 142, this.indoor = false});

  final double height;
  final bool indoor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _PitchPainter(indoor: indoor),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withValues(alpha: .55)],
            ),
          ),
        ),
      ),
    );
  }
}

class _PitchPainter extends CustomPainter {
  const _PitchPainter({required this.indoor});
  final bool indoor;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final bg = Paint()
      ..shader = LinearGradient(
        colors: indoor
            ? const [Color(0xFF142B2A), Color(0xFF31564A), Color(0xFF0B2119)]
            : const [Color(0xFF172A22), Color(0xFF467B42), Color(0xFF10291D)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, bg);

    final stand = Paint()
      ..color = const Color(0xFF111B19).withValues(alpha: .85);
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h * .35), stand);
    final rail = Paint()
      ..color = const Color(0xFFB5D0C0).withValues(alpha: .22)
      ..strokeWidth = 1;
    for (var i = 0; i < 5; i++) {
      final y = h * (.08 + i * .055);
      canvas.drawLine(Offset(0, y), Offset(w, y), rail);
    }
    final light = Paint()
      ..color = const Color(0xFFD9FFE4).withValues(alpha: .75)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 13);
    for (final x in [w * .08, w * .92]) {
      canvas.drawCircle(Offset(x, h * .12), 4, light);
    }

    final field = Path()
      ..moveTo(w * .13, h * .32)
      ..lineTo(w * .87, h * .32)
      ..lineTo(w * 1.08, h * 1.04)
      ..lineTo(w * -.08, h * 1.04)
      ..close();
    final grass = Paint()..color = const Color(0xFF43864B);
    canvas.drawPath(field, grass);
    final stripe = Paint()
      ..color = const Color(0xFF8EC66A).withValues(alpha: .18);
    for (var i = 0; i < 7; i++) {
      final left = w * (-.08 + i * .17);
      final path = Path()
        ..moveTo(left, h)
        ..lineTo(left + w * .10, h)
        ..lineTo(w * .48 + (left - w * .48) * .65, h * .32)
        ..lineTo(w * .48 + (left - w * .48) * .65 + w * .07, h * .32)
        ..close();
      if (i.isEven) canvas.drawPath(path, stripe);
    }
    final marking = Paint()
      ..color = const Color(0xFFE7F4E7).withValues(alpha: .72)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    canvas.drawPath(
      Path()
        ..moveTo(w * .13, h * .32)
        ..lineTo(w * .87, h * .32)
        ..lineTo(w * 1.08, h * 1.04)
        ..lineTo(w * -.08, h * 1.04)
        ..close(),
      marking,
    );
    canvas.drawLine(Offset(w * .5, h * .32), Offset(w * .5, h), marking);
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(w * .5, h * .68),
        width: w * .22,
        height: h * .22,
      ),
      marking,
    );
    canvas.drawRect(Rect.fromLTWH(w * .37, h * .32, w * .26, h * .16), marking);
  }

  @override
  bool shouldRepaint(covariant _PitchPainter oldDelegate) =>
      oldDelegate.indoor != indoor;
}
