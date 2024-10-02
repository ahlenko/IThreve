import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class TextSelector extends StatefulWidget {
  final String text;
  final bool selected;
  final double? width;
  final Function(bool) onSelect;
  const TextSelector(
      {super.key,
      required this.selected,
      required this.text,
      this.width,
      required this.onSelect});

  @override
  State<TextSelector> createState() => _TextSelectorState();
}

class _TextSelectorState extends State<TextSelector> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onSelect(!widget.selected),
        child: Container(
          height: 77,
          width: widget.width,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: WEBColors.white.withOpacity(hovered ? 0.3 : 0.1),
              border: Border.all(
                  width: 2,
                  color:
                      widget.selected ? WEBColors.cyan : Colors.transparent)),
          child: Row(
            children: [
              SvgPicture.asset(widget.selected
                  ? Vector.roundChecked
                  : Vector.roundUnchecked),
              spacerHorizontal(16),
              Text(
                widget.text,
                style: Types.whiteRegular24TStyle.copyWith(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
