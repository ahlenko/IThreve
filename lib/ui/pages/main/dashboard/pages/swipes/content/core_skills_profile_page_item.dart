import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/selectors/skills_rating_bar.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class CoreSkillsProfilePageItem extends StatelessWidget {
  const CoreSkillsProfilePageItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 24, right: 4, bottom: 44),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.ucoreSkills,
                style: Types.whiteRegular24TStyle
                    .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              spacerVertical(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'UI/UX DESIGN',
                    style: Types.headerButtonTStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        color: WEBColors.white.withOpacity(0.66)),
                  ),
                  SvgPicture.asset(Vector.arrowDown)
                ],
              ),
              spacerVertical(8),
              Text(
                'UX',
                style: Types.buttonBoltH4TStyle,
              ),
              spacerVertical(5),
              for (var i = 0; i < 3; i++)
                const SkillRatingBar(
                  score: 1,
                  skill: 'User Flow/Journey',
                ),
              Text(
                'UX',
                style: Types.buttonBoltH4TStyle,
              ),
              spacerVertical(5),
              for (var i = 0; i < 3; i++)
                const SkillRatingBar(
                  score: 1,
                  skill: 'User Flow/Journey',
                ),
              Text(
                'UX',
                style: Types.buttonBoltH4TStyle,
              ),
              spacerVertical(5),
              for (var i = 0; i < 3; i++)
                const SkillRatingBar(
                  score: 1,
                  skill: 'User Flow/Journey',
                )
            ],
          ),
        ),
      ),
    );
  }
}
