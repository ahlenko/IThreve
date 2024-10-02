import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/theme/colors.dart';

class GradientBorderContainer extends StatelessWidget {
  final Widget child;

  const GradientBorderContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: GradientBorderPainter(),
        child: IntrinsicWidth(
          child: IntrinsicHeight(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          WEBColors.white.withOpacity(0.4),
          WEBColors.white.withOpacity(0.1)
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final RRect rrect =
        RRect.fromRectAndRadius(rect, const Radius.circular(20));

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
