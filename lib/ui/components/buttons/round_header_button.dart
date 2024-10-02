import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class RoundHeaderButton extends StatefulWidget {
  final Function() onClick;
  final String text;
  final Color backgroundColor;
  const RoundHeaderButton(
      {super.key,
      required this.onClick,
      required this.text,
      required this.backgroundColor});

  @override
  State<RoundHeaderButton> createState() => _RoundHeaderButtonState();
}

class _RoundHeaderButtonState extends State<RoundHeaderButton> {
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
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 4, color: WEBColors.white),
            color: widget.backgroundColor.withOpacity(covered ? 1 : 0.80),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: double.infinity,
          child: Center(
            child: Text(widget.text, style: Types.headerButton16TStyle),
          ),
        ),
      ),
    );
  }
}
