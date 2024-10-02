import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class SkillRatingBar extends StatelessWidget {
  final String skill;
  final int score;
  const SkillRatingBar({super.key, required this.score, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          skill,
          style: Types.buttonH4TStyle,
        ),
        spacerVertical(4),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: score > 0
                        ? WEBColors.cyan
                        : WEBColors.liteGray.withOpacity(0.1)),
              ),
            ),
            spacerHorizontal(24),
            Expanded(
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: score > 1
                        ? WEBColors.cyan
                        : WEBColors.liteGray.withOpacity(0.1)),
              ),
            ),
            spacerHorizontal(24),
            Expanded(
              child: Container(
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: score > 2
                        ? WEBColors.cyan
                        : WEBColors.liteGray.withOpacity(0.1)),
              ),
            )
          ],
        ),
        spacerVertical(2),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            'Beginner',
            style: Types.buttonH4TStyle
                .copyWith(color: WEBColors.white.withOpacity(0.66)),
          ),
        ),
      ],
    );
  }
}
