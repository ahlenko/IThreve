import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/domain/model/rate_selected.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class SelectableItem extends StatefulWidget {
  final RateSelected item;
  final Function() onChangeSelection;
  const SelectableItem({required this.item, required this.onChangeSelection});

  @override
  State<SelectableItem> createState() => _SelectableItemState();
}

class _SelectableItemState extends State<SelectableItem> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onChangeSelection(),
        child: IntrinsicWidth(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: widget.item.selected &&
                        !hovered &&
                        widget.item.title != Strings.other
                    ? WEBColors.darkGreen.withOpacity(0.2)
                    : WEBColors.white.withOpacity(hovered
                        ? 0.3
                        : widget.item.title == Strings.other &&
                                widget.item.selected
                            ? 0.3
                            : 0.1),
                border: Border.all(
                    width: 2,
                    color: widget.item.selected &&
                            widget.item.title != Strings.other
                        ? WEBColors.cyan
                        : Colors.transparent)),
            child: Row(
              children: [
                if (!widget.item.selected || widget.item.title == Strings.other)
                  SvgPicture.asset(Vector.plusCircle),
                Padding(
                  padding: EdgeInsets.only(
                      left: !widget.item.selected ||
                              widget.item.title == Strings.other
                          ? 16
                          : 0,
                      right: widget.item.selected &&
                              widget.item.title != Strings.other
                          ? 16
                          : 0),
                  child: Text(
                    widget.item.title,
                    style: Types.whiteRegular24TStyle.copyWith(fontSize: 24),
                  ),
                ),
                if (widget.item.selected && widget.item.title != Strings.other)
                  SvgPicture.asset(Vector.minusCircle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
