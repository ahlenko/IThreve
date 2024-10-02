import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/progress/progress_with_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class OverviewProfilePageItem extends StatelessWidget {
  const OverviewProfilePageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.only(
                  left: 24, top: 10, bottom: 10, right: 6),
              decoration: BoxDecoration(
                  color: WEBColors.drawerColor,
                  borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 18, top: 14, bottom: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Vector.like),
                          spacerHorizontal(4),
                          Text(
                            Strings.strengthIsHere,
                            style:
                                Types.buttonBoltH4TStyle.copyWith(fontSize: 20),
                          ),
                        ],
                      ),
                      spacerVertical(16),
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            ProgressWithText(
                              text: Strings.ucoreSkills,
                              progress: 90,
                              color: WEBColors.cyan,
                              size: 94,
                              progressTextSize: 24,
                              strokeWidth: 7,
                              titleTextSize: 12,
                            ),
                            ProgressWithText(
                              text: Strings.projects,
                              progress: 90,
                              color: WEBColors.cyan,
                              size: 94,
                              progressTextSize: 24,
                              strokeWidth: 7,
                              titleTextSize: 12,
                            ),
                          ],
                        ),
                      ),
                      spacerVertical(32),
                      for (var i = 0; i < 4; i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Strings.ucoreSkills.toUpperCase(),
                                style: Types.buttonBoltH4TStyle.copyWith(
                                    fontSize: 14,
                                    color: WEBColors.white.withOpacity(0.66))),
                            spacerVertical(5),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (var i = 0; i < 4; i++)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color:
                                            WEBColors.white.withOpacity(0.05),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      'Design system',
                                      style: Types.buttonH4TStyle,
                                    ),
                                  )
                              ],
                            ),
                            spacerVertical(16),
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
          spacerHorizontal(24),
          Expanded(
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.only(
                  left: 24, top: 10, bottom: 10, right: 6),
              decoration: BoxDecoration(
                  color: WEBColors.drawerColor,
                  borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 18, top: 14, bottom: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(Vector.dislike),
                          spacerHorizontal(4),
                          Text(
                            Strings.weaknessIsHere,
                            style:
                                Types.buttonBoltH4TStyle.copyWith(fontSize: 20),
                          )
                        ],
                      ),
                      spacerVertical(16),
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: [
                            ProgressWithText(
                              text: Strings.logistics,
                              progress: 5,
                              color: WEBColors.erroeRed,
                              size: 94,
                              progressTextSize: 24,
                              strokeWidth: 7,
                              titleTextSize: 12,
                            ),
                            ProgressWithText(
                              text: Strings.interests,
                              progress: 25,
                              color: WEBColors.yellow,
                              size: 94,
                              progressTextSize: 24,
                              strokeWidth: 7,
                              titleTextSize: 12,
                            ),
                          ],
                        ),
                      ),
                      spacerVertical(32),
                      for (var i = 0; i < 4; i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Strings.ucoreSkills.toUpperCase(),
                                style: Types.buttonBoltH4TStyle.copyWith(
                                    fontSize: 14,
                                    color: WEBColors.white.withOpacity(0.66))),
                            spacerVertical(5),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: [
                                for (var i = 0; i < 4; i++)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color:
                                            WEBColors.white.withOpacity(0.05),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Design system',
                                          style: Types.buttonH4TStyle.copyWith(
                                              color: WEBColors.white
                                                  .withOpacity(0.66)),
                                        ),
                                        spacerHorizontal(8),
                                        Text(
                                          'Design system',
                                          style: Types.buttonH4TStyle,
                                        ),
                                      ],
                                    ),
                                  )
                              ],
                            ),
                            spacerVertical(16),
                          ],
                        )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
