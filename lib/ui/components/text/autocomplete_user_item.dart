import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class AutocompleteUserItem extends StatefulWidget {
  final String text;
  final String addText;
  final bool isFirst;
  final bool isLast;
  final Function() onTap;

  const AutocompleteUserItem({
    super.key,
    required this.text,
    required this.addText,
    required this.isFirst,
    required this.isLast,
    required this.onTap,
  });
  @override
  State<AutocompleteUserItem> createState() => _AutocompleteUserItemState();
}

class _AutocompleteUserItemState extends State<AutocompleteUserItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
              color: hovered ? WEBColors.darkCyan : WEBColors.darkDialogGray,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(widget.isFirst ? 10 : 0),
                  bottom: Radius.circular(widget.isLast ? 10 : 0))),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SvgPicture.asset(Vector.user),
              spacerHorizontal(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.text,
                      style: Types.headerItemTStyle.copyWith(
                          fontWeight: hovered ? FontWeight.bold : null)),
                  Text(widget.addText,
                      style: Types.textFieldTitleTStyle.copyWith(fontSize: 14)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
