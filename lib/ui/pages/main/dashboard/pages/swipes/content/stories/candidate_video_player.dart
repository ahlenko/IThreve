import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';

class CandidateVideoPlayer extends StatelessWidget {
  const CandidateVideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 24,
          right: 24,
          left: UiConst.drawerWidthCompact + 24,
          bottom: 24),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => {},
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color.fromARGB(255, 65, 65, 65)),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                      child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        color: WEBColors.white.withOpacity(0.10),
                        child: const Icon(
                          Icons.arrow_back_ios_outlined,
                          color: WEBColors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  )),
                  ClipOval(
                      child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        color: WEBColors.white.withOpacity(0.10),
                        child: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: WEBColors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
          Positioned(
              top: 24,
              left: 24,
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.close,
                        color: WEBColors.fontWhite,
                      )))),
          Positioned(
            bottom: 24,
            right: 24,
            child: ClipOval(
                child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(35),
                  color: WEBColors.black.withOpacity(0.25),
                  child: SvgPicture.asset(
                    Vector.play,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            )),
          )
        ],
      ),
    );
  }
}
