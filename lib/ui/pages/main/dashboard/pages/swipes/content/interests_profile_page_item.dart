import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class InterestsProfilePageItem extends StatelessWidget {
  const InterestsProfilePageItem({super.key});

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
                Strings.uAdditionalSkills,
                style: Types.whiteRegular24TStyle
                    .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              spacerVertical(24),
              for (var i = 0; i < 6; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'INDUSTRY OF INTEREST',
                      style: Types.textLinkTStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          color: WEBColors.white.withOpacity(0.66)),
                    ),
                    spacerVertical(8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (var y = 0; y < 4; y++)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                                color: WEBColors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Cryptocurrencies',
                                  style: Types.buttonH4TStyle.copyWith(
                                      color: WEBColors.white
                                          .withOpacity(y == 0 ? 1 : 0.66),
                                      fontWeight:
                                          y == 0 ? FontWeight.bold : null),
                                ),
                                Offstage(
                                  offstage: y != 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 6),
                                    child: SvgPicture.asset(
                                      Vector.checkCircle,
                                      height: 20,
                                      width: 20,
                                      color: WEBColors.liteGreen,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                    spacerVertical(24),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
