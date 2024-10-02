import 'package:flutter/material.dart';

class ClickableTextButton extends StatefulWidget {
  final Function() onClick;
  final String text;
  final TextStyle hoveredStyle;
  final TextStyle regularStyle;
  const ClickableTextButton(
      {super.key,
      required this.onClick,
      required this.text,
      required this.hoveredStyle,
      required this.regularStyle});

  @override
  State<ClickableTextButton> createState() => _HeaderNavItemState();
}

class _HeaderNavItemState extends State<ClickableTextButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onClick(),
        child: Text(
          widget.text,
          style: hovered ? widget.hoveredStyle : widget.regularStyle,
        ),
      ),
    );
  }
}
