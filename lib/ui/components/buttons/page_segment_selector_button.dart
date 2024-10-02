import 'package:flutter/material.dart';
import 'package:ithreve_web/domain/model/selected_with_count.dart';
import 'package:ithreve_web/ui/components/progress/progress_with_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class PageSegmentSelectroButton extends StatefulWidget {
  final int pageCount;
  final int pageNumber;
  final SelectedWithCount pageData;
  final VoidCallback onSelectPage;

  const PageSegmentSelectroButton(
      {super.key,
      required this.onSelectPage,
      required this.pageCount,
      required this.pageData,
      required this.pageNumber});

  @override
  State<PageSegmentSelectroButton> createState() =>
      _PageSegmentSelectroButtonState();
}

class _PageSegmentSelectroButtonState extends State<PageSegmentSelectroButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() {
        hovered = true;
      }),
      onExit: (_) => setState(() {
        hovered = false;
      }),
      child: GestureDetector(
        onTap: widget.onSelectPage,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.pageNumber == 0 ? 10 : 0),
                      topRight: Radius.circular(
                          widget.pageNumber == widget.pageCount - 1 ? 10 : 0)),
                  color: widget.pageData.selected
                      ? WEBColors.nightDarknes
                      : hovered
                          ? WEBColors.nightDarknes.withOpacity(0.6)
                          : null),
              child: Row(
                children: [
                  Offstage(
                    offstage: widget.pageNumber == 0 ||
                        widget.pageNumber == widget.pageCount - 1,
                    child: ProgressWithText(
                      progress: widget.pageData.count,
                      color: WEBColors.cyan,
                      size: 32,
                      rounded: true,
                      progressTextSize: 8,
                      strokeWidth: 4,
                    ),
                  ),
                  spacerHorizontal(widget.pageNumber == 0 ||
                          widget.pageNumber == widget.pageCount - 1
                      ? 0
                      : 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.5),
                    child: Text(
                      widget.pageData.title,
                      style: widget.pageData.selected
                          ? Types.buttonBoltH4TStyle
                          : Types.buttonH4TStyle,
                    ),
                  )
                ],
              ),
            ),
            if (widget.pageNumber < widget.pageCount - 1 &&
                !widget.pageData.selected)
              Container(
                width: 1,
                height: 64,
                color: WEBColors.nightDarknes,
              )
          ],
        ),
      ),
    );
  }
}
