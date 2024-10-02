import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class RoundedBackgroundButton extends StatefulWidget {
  final Function() onClick;
  final String text;
  final Color backgroundColor;
  final double horizontalSpacer;
  const RoundedBackgroundButton({
    super.key,
    required this.onClick,
    required this.text,
    this.horizontalSpacer = 20,
    required this.backgroundColor,
  });

  @override
  State<RoundedBackgroundButton> createState() =>
      _RoundedBackgroundButtonState();
}

class _RoundedBackgroundButtonState extends State<RoundedBackgroundButton> {
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
            borderRadius: BorderRadius.circular(10),
            color: covered
                ? widget.backgroundColor
                : widget.backgroundColor.withOpacity(0.8),
          ),
          padding: EdgeInsets.symmetric(horizontal: widget.horizontalSpacer),
          height: double.infinity,
          child: Center(
            child: Text(
              widget.text,
              style: Types.headerButtonTStyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
