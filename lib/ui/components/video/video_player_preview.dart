import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class VideoPlayerPreview extends StatefulWidget {
  final String videoName;
  final bool isDelete;
  final bool isEnableDelete;
  final Function() onPlayClick;
  final Function()? onDeleteClick;
  final Function()? onLoadClick;

  const VideoPlayerPreview(
      {super.key,
      required this.videoName,
      this.isDelete = false,
      this.isEnableDelete = false,
      required this.onPlayClick,
      this.onDeleteClick,
      this.onLoadClick});

  @override
  State<VideoPlayerPreview> createState() => _VideoPlayerPreviewState();
}

class _VideoPlayerPreviewState extends State<VideoPlayerPreview> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.videoName,
              style: Types.buttonH4TStyle
                  .copyWith(color: WEBColors.white.withOpacity(0.66)),
            ),
            spacerVertical(4),
            MouseRegion(
              onEnter: (_) => setState(() => hovered = true),
              onExit: (_) => setState(() => hovered = false),
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  if (widget.isDelete) {
                    widget.onLoadClick!();
                  } else {
                    widget.onPlayClick();
                  }
                },
                child: Container(
                  width: 205,
                  height: 135,
                  decoration: BoxDecoration(
                      color:
                          WEBColors.liteGray.withOpacity(hovered ? 0.05 : 0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: SvgPicture.asset(
                      widget.isDelete ? Vector.plusCircle20 : Vector.play,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
            right: 1,
            top: 9,
            child: Offstage(
              offstage: widget.isDelete || !widget.isEnableDelete,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => widget.onDeleteClick!(),
                  child: SvgPicture.asset(
                    Vector.removeCircle,
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
