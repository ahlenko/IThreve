import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class HeaderNavButton extends StatefulWidget {
  final Function() onClick;
  final String text;
  final bool withDecoration;
  final double horizontalPadding;

  const HeaderNavButton(
      {super.key,
      required this.onClick,
      required this.text,
      this.horizontalPadding = 28,
      this.withDecoration = false});

  @override
  State<HeaderNavButton> createState() => _HeaderNavItemState();
}

class _HeaderNavItemState extends State<HeaderNavButton> {
  bool covered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => covered = true),
      onExit: (_) => setState(() => covered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onClick(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
          child: Text(
            widget.text,
            style: Types.headerItem16TStyle.copyWith(
                decoration:
                    widget.withDecoration ? TextDecoration.underline : null,
                decorationColor: covered
                    ? WEBColors.white
                    : WEBColors.white.withOpacity(0.66),
                color: covered ? null : WEBColors.white.withOpacity(0.66)),
          ),
        ),
      ),
    );
  }
}
