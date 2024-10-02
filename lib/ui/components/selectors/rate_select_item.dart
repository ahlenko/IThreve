import 'package:flutter/material.dart';
import 'package:ithreve_web/domain/model/rate_selected.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class RateSelectedItem extends StatefulWidget {
  final RateSelected item;
  final bool showTitle;
  final String minGrade;
  final String maxGrade;
  final bool enableCompactMode;
  final Function(int) onRated;
  const RateSelectedItem(
      {super.key,
      required this.onRated,
      required this.item,
      required this.maxGrade,
      required this.minGrade,
      this.enableCompactMode = false,
      this.showTitle = false});

  @override
  State<RateSelectedItem> createState() => _RateSelectedItemState();
}

class _RateSelectedItemState extends State<RateSelectedItem> {
  List<bool> hovered = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Offstage(
          offstage: !widget.showTitle,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              widget.item.title,
              style: Types.headerButtonTStyle,
            ),
          ),
        ),
        if (widget.enableCompactMode)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.minGrade,
                  style: Types.buttonH4TStyle
                      .copyWith(color: WEBColors.white.withOpacity(0.66)),
                ),
              ],
            ),
          ),
        Wrap(
          spacing: 40,
          runSpacing: 40,
          children: [
            for (var i = 0; i < (widget.enableCompactMode ? 6 : 5); i++)
              if (i < 5)
                MouseRegion(
                    onEnter: (_) => setState(() => hovered[i] = true),
                    onExit: (_) => setState(() => hovered[i] = false),
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () => widget.onRated(i + 1),
                        child: Container(
                          width: 98,
                          height: 98,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 4,
                                color: widget.item.rate == i + 1
                                    ? WEBColors.cyan
                                    : Colors.transparent),
                            color: widget.item.rate == i + 1 && !hovered[i]
                                ? WEBColors.darkGreen.withOpacity(0.2)
                                : WEBColors.white
                                    .withOpacity(hovered[i] ? 0.3 : 0.1),
                          ),
                          child: Center(
                            child: Text(
                              '${i + 1}',
                              style: Types.headerLogoTStyle,
                            ),
                          ),
                        )))
              else
                SizedBox(
                  height: 98,
                  width: 98,
                  child: Center(
                    child: Text(
                      widget.maxGrade,
                      style: Types.buttonH4TStyle.copyWith(
                          color: WEBColors.white.withOpacity(0.66),
                          fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
          ],
        ),
        if (!widget.enableCompactMode)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.minGrade,
                  style: Types.buttonH4TStyle
                      .copyWith(color: WEBColors.white.withOpacity(0.66)),
                ),
                Text(
                  widget.maxGrade,
                  style: Types.buttonH4TStyle
                      .copyWith(color: WEBColors.white.withOpacity(0.66)),
                ),
              ],
            ),
          )
      ],
    );
  }
}
