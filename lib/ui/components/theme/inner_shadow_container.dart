import 'package:flutter/material.dart';

class InnerShadowContainer extends StatelessWidget {
  final double x;
  final double y;
  final double blur;
  final Color color;
  final double spread;
  final Widget child;

  const InnerShadowContainer({
    super.key,
    required this.x,
    required this.y,
    required this.blur,
    required this.color,
    required this.spread,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: InnerShadowPainter(
        x: x,
        y: y,
        blur: blur,
        color: color,
        spread: spread,
      ),
      child: child,
    );
  }
}

class InnerShadowPainter extends CustomPainter {
  final double x;
  final double y;
  final double blur;
  final Color color;
  final double spread;

  InnerShadowPainter({
    required this.x,
    required this.y,
    required this.blur,
    required this.color,
    required this.spread,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    Paint shadowPaint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);

    canvas.saveLayer(rect, Paint());

    canvas.drawRect(rect, shadowPaint);
    canvas.translate(x, y);
    canvas.drawRect(rect.inflate(spread), shadowPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
