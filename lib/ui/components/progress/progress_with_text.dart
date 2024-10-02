import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/fonts.dart';
import 'package:ithreve_web/ui/theme/colors.dart';

class ProgressWithText extends StatelessWidget {
  final String? text;
  final int progress;
  final Color color;
  final double size;
  final double progressTextSize;
  final double strokeWidth;
  final bool rounded;
  final double titleTextSize;

  const ProgressWithText(
      {super.key,
      this.text,
      this.rounded = false,
      required this.progress,
      required this.color,
      required this.size,
      required this.progressTextSize,
      required this.strokeWidth,
      this.titleTextSize = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          if (!rounded)
            CustomPaint(
              painter: _CustomCircularProgressBar(
                color: color,
                backgroundColor: color.withOpacity(0.2),
                progress: progress.toDouble() / 100,
                strokeWidth: strokeWidth,
              ),
              size: Size(size, size),
            )
          else
            CustomPaint(
              painter: _CustomCircularProgressBar2(
                color: color,
                backgroundColor: color.withOpacity(0.2),
                progress: progress.toDouble() / 100,
                strokeWidth: strokeWidth,
              ),
              size: Size(size, size),
            ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$progress%',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: progressTextSize,
                        color: WEBColors.white,
                        fontFamily: Fonts.sfProRegular,
                        fontWeight: FontWeight.bold)),
                Offstage(
                  offstage: text == null,
                  child: Text(text ?? '',
                      style: TextStyle(
                          fontSize: titleTextSize,
                          color: WEBColors.white,
                          fontFamily: Fonts.sfProRegular,
                          fontWeight: FontWeight.w400)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomCircularProgressBar extends CustomPainter {
  final Color color;
  final Color backgroundColor;
  final double progress;
  final double strokeWidth;

  _CustomCircularProgressBar({
    required this.color,
    required this.backgroundColor,
    required this.progress,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius =
        min(size.width / 2 - strokeWidth, size.height / 2 - strokeWidth);
    canvas.drawCircle(center, radius, paint);
    final innerPaint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;
    final outerPaint = Paint()
      ..color = color
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;
    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius + (strokeWidth / 2)),
      startAngle,
      sweepAngle,
      false,
      innerPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - (strokeWidth / 2)),
      startAngle,
      sweepAngle,
      false,
      outerPaint,
    );
    canvas.drawLine(
      Offset(center.dx, (strokeWidth / 2)),
      Offset(center.dx, strokeWidth * 1.5),
      outerPaint,
    );
    final innerEndPoint = Offset(
      center.dx + (radius - (strokeWidth / 2)) * cos(startAngle + sweepAngle),
      center.dy + (radius - (strokeWidth / 2)) * sin(startAngle + sweepAngle),
    );
    final outerEndPoint = Offset(
      center.dx + (radius + (strokeWidth / 2)) * cos(startAngle + sweepAngle),
      center.dy + (radius + (strokeWidth / 2)) * sin(startAngle + sweepAngle),
    );
    canvas.drawLine(innerEndPoint, outerEndPoint, outerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _CustomCircularProgressBar2 extends CustomPainter {
  final Color color;
  final Color backgroundColor;
  final double progress;
  final double strokeWidth;

  _CustomCircularProgressBar2({
    required this.color,
    required this.backgroundColor,
    required this.progress,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius =
        min(size.width / 2 - strokeWidth, size.height / 2 - strokeWidth);

    canvas.drawCircle(center, radius, paint);

    final progressPaint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const startAngle = -pi / 2;
    final sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
