import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';

import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class HistoryProfilePageItem extends StatelessWidget {
  const HistoryProfilePageItem({super.key});

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
                  left: 24, top: 24, bottom: 10, right: 6),
              decoration: BoxDecoration(
                  color: WEBColors.drawerColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.strengthIsHere,
                          style:
                              Types.buttonBoltH4TStyle.copyWith(fontSize: 20),
                        ),
                        SvgPicture.asset(Vector.badgeCheck),
                      ],
                    ),
                  ),
                  spacerVertical(32),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18, bottom: 14),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var i = 0; i < 3; i++)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('JAN 2024 - PRESENT',
                                          style: Types.buttonH4TStyle.copyWith(
                                              fontSize: 14,
                                              color: WEBColors.white
                                                  .withOpacity(0.66))),
                                      spacerVertical(4),
                                      Text('iThrive',
                                          style: Types.buttonH4TStyle.copyWith(
                                              fontSize: 16,
                                              color: WEBColors.white)),
                                      Text('Founder, Product Designer',
                                          style: Types.buttonH4TStyle.copyWith(
                                              fontSize: 16,
                                              color: WEBColors.white)),
                                      spacerVertical(4),
                                      for (var i = 0; i < 3; i++)
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  ' •  I led the Mobile and Web App Design. ',
                                                  style: Types.buttonH4TStyle
                                                      .copyWith(
                                                          fontSize: 14,
                                                          color: WEBColors.white
                                                              .withOpacity(
                                                                  0.66))),
                                              spacerVertical(4),
                                            ]),
                                      spacerVertical(4),
                                      ClickableTextButton(
                                          onClick: () {},
                                          regularStyle: Types.textLinkTStyle
                                              .copyWith(
                                                  color: WEBColors.darkGreen,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor:
                                                      WEBColors.darkGreen),
                                          hoveredStyle: Types.textLinkTStyle
                                              .copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor:
                                                      WEBColors.cyan),
                                          text: 'Project here'),
                                      spacerVertical(24),
                                    ],
                                  )
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          spacerHorizontal(24),
          Expanded(
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.only(
                  left: 24, top: 24, bottom: 10, right: 6),
              decoration: BoxDecoration(
                  color: WEBColors.drawerColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Strings.strengthIsHere,
                          style:
                              Types.buttonBoltH4TStyle.copyWith(fontSize: 20),
                        ),
                        SvgPicture.asset(Vector.badgeCheck),
                      ],
                    ),
                  ),
                  spacerVertical(32),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18, bottom: 14),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var i = 0; i < 7; i++)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('MASTERS IN MUSIC',
                                          style: Types.buttonH4TStyle.copyWith(
                                              fontSize: 14,
                                              color: WEBColors.white
                                                  .withOpacity(0.66))),
                                      spacerVertical(4),
                                      Text('Colburn School of Music',
                                          style: Types.buttonH4TStyle.copyWith(
                                              fontSize: 16,
                                              color: WEBColors.white)),
                                      Text('Flute Performance Major',
                                          style: Types.buttonH4TStyle.copyWith(
                                              fontSize: 16,
                                              color: WEBColors.white)),
                                      Text('2020 - 2022',
                                          style: Types.buttonH4TStyle.copyWith(
                                              fontSize: 16,
                                              color: WEBColors.white)),
                                      spacerVertical(24),
                                    ],
                                  )
                              ]),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
