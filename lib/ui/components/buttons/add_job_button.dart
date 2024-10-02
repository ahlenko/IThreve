import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class AddJobButton extends StatefulWidget {
  final Function() onClick;
  final bool isExpanded;
  const AddJobButton(
      {super.key, required this.isExpanded, required this.onClick});

  @override
  State<AddJobButton> createState() => _AddJobButtonState();
}

class _AddJobButtonState extends State<AddJobButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.isExpanded ? 27 : 0),
      child: MouseRegion(
          onEnter: (_) => setState(() => hovered = true),
          onExit: (_) => setState(() => hovered = false),
          cursor: SystemMouseCursors.click,
          child: Container(
            height: widget.isExpanded ? null : 56,
            width: widget.isExpanded ? null : 56,
            decoration: BoxDecoration(
                border: Border.all(color: WEBColors.cyan, width: 2),
                borderRadius: BorderRadius.circular(widget.isExpanded ? 6 : 8),
                color: hovered
                    ? WEBColors.grayEl.withOpacity(0.8)
                    : WEBColors.grayEl),
            padding: EdgeInsets.symmetric(vertical: widget.isExpanded ? 16 : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Vector.addJob),
                Offstage(
                    offstage: !widget.isExpanded,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(Strings.addANewJob,
                          style: Types.buttonBoltH4TStyle),
                    ))
              ],
            ),
          )),
    );
  }
}
