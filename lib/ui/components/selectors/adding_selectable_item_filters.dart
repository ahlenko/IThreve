import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/domain/model/selected_unselected.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class AddingSelectableItemFilters extends StatefulWidget {
  final SelectedUnselected item;
  final Function() onChangeSelection;
  const AddingSelectableItemFilters(
      {super.key, required this.item, required this.onChangeSelection});

  @override
  State<AddingSelectableItemFilters> createState() => _SelectableItemState();
}

class _SelectableItemState extends State<AddingSelectableItemFilters> {
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: widget.item.selected &&
                      !hovered &&
                      widget.item.title != Strings.other
                  ? WEBColors.cyan.withOpacity(0.2)
                  : WEBColors.white.withOpacity(hovered
                      ? 0.3
                      : widget.item.title == Strings.other &&
                              widget.item.selected
                          ? 0.3
                          : 0.1),
            ),
            child: Row(
              children: [
                if (!widget.item.selected || widget.item.title == Strings.other)
                  SvgPicture.asset(Vector.plusCircle, width: 17, height: 17),
                Padding(
                  padding: EdgeInsets.only(
                      left: !widget.item.selected ||
                              widget.item.title == Strings.other
                          ? 4
                          : 0,
                      right: widget.item.selected &&
                              widget.item.title != Strings.other
                          ? 4
                          : 0),
                  child: Text(
                    widget.item.title,
                    style: Types.buttonH4TStyle.copyWith(),
                  ),
                ),
                if (widget.item.selected && widget.item.title != Strings.other)
                  SvgPicture.asset(Vector.minusCircle, width: 17, height: 17),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
