import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class RoundedIconButton extends StatefulWidget {
  final Function() onClick;
  final String text;
  final String iconPath;
  final Color borderColor;
  final Color? backgroundColor;
  final double borderRadius;
  const RoundedIconButton(
      {super.key,
      required this.onClick,
      required this.text,
      required this.iconPath,
      this.borderColor = Colors.white,
      this.backgroundColor,
      this.borderRadius = 10});

  @override
  State<RoundedIconButton> createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
  bool covered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => covered = true),
      onExit: (_) => setState(() => covered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onClick(),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: widget.borderColor, width: 1),
            borderRadius: BorderRadius.circular(widget.borderRadius),
            color: covered
                ? widget.backgroundColor?.withOpacity(0.3) ??
                    WEBColors.white.withOpacity(0.1)
                : widget.backgroundColor?.withOpacity(0.1) ??
                    Colors.transparent,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  widget.iconPath,
                  height: 20,
                  width: 20,
                ),
                spacerHorizontal(8),
                Text(
                  widget.text,
                  style: Types.buttonH4TStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
