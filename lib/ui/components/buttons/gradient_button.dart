import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class GradientButton extends StatefulWidget {
  final Function() onClick;
  final String text;
  final double height;
  final double horizontalSpacer;
  final String? gradientSource;
  const GradientButton(
      {super.key,
      required this.onClick,
      required this.text,
      this.height = 100,
      this.horizontalSpacer = 92,
      this.gradientSource});

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.gradientSource ?? Raster.turquoiseGradient),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(4, 38),
            blurRadius: 62,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () {
          widget.onClick();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 14.0, horizontal: widget.horizontalSpacer),
          child: Text(
            widget.text,
            style: Types.whiteBottonTStyle,
          ),
        ),
      ),
    );
  }
}
