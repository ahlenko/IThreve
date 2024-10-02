import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class RoundedAddRemovable extends StatefulWidget {
  final bool isAddition;
  final bool isRemove;
  final String? icon;
  final String title;
  final Function()? onClick;
  final bool withoutButton;
  final TextEditingController? controller;

  const RoundedAddRemovable(
      {super.key,
      this.isAddition = false,
      this.isRemove = false,
      this.withoutButton = false,
      this.icon,
      this.onClick,
      required this.title,
      this.controller});

  @override
  State<RoundedAddRemovable> createState() => _RoundedAddRemovableState();
}

class _RoundedAddRemovableState extends State<RoundedAddRemovable> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Offstage(
          offstage: widget.withoutButton,
          child: MouseRegion(
            onEnter: (_) => setState(() => hovered = true),
            onExit: (_) => setState(() => hovered = false),
            cursor: widget.isAddition || widget.isRemove
                ? SystemMouseCursors.click
                : MouseCursor.defer,
            child: GestureDetector(
              onTap: () {
                if (widget.isAddition || widget.isRemove) widget.onClick!();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: WEBColors.white
                        .withOpacity(widget.isAddition || widget.isRemove
                            ? hovered
                                ? 0.3
                                : 0.1
                            : 0.1),
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(bottom: 6),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Offstage(
                      offstage: !(widget.isAddition || widget.icon != null),
                      child: SvgPicture.asset(
                        widget.isAddition
                            ? Vector.plusCircle20
                            : Vector.userGroup,
                        width: 16,
                        height: 16,
                      ),
                    ),
                    spacerHorizontal(
                        widget.isAddition || widget.icon != null ? 4 : 0),
                    Text(
                      widget.title,
                      style: Types.buttonH4TStyle,
                    ),
                    spacerHorizontal(widget.isRemove ? 4 : 0),
                    Offstage(
                      offstage: !widget.isRemove,
                      child: SvgPicture.asset(
                        Vector.minusCircle,
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Offstage(
          offstage: widget.controller == null,
          child: Padding(
            padding: EdgeInsets.only(
                left: widget.withoutButton ? 0 : 8, bottom: 6, right: 8),
            child: IntrinsicWidth(
              child: TextFormField(
                onChanged: (value) {},
                cursorColor: WEBColors.cyan,
                onFieldSubmitted: (value) => widget.onClick!(),
                controller: widget.controller,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                    hintText: widget.withoutButton
                        ? Strings.addHere
                        : Strings.typeHere,
                    border: InputBorder.none,
                    constraints: const BoxConstraints(maxHeight: 31),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: WEBColors.fieldGray.withOpacity(0.3),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: WEBColors.cyan,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    hintStyle: Types.textFieldTStyle.copyWith(fontSize: 16)),
                style: Types.textFieldTStyle
                    .copyWith(color: WEBColors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
