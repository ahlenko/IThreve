import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/content/stories/candidate_video_player.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class ProjectsProfilePageItem extends StatelessWidget {
  final bool expandedViewEnable;
  final Function() onExpandedChange;
  const ProjectsProfilePageItem(
      {super.key,
      required this.expandedViewEnable,
      required this.onExpandedChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'iThrive Mobile and Web App',
                    style: Types.whiteRegular24TStyle
                        .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Offstage(
                    offstage: expandedViewEnable,
                    child: Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => {},
                            child: const Icon(
                              Icons.arrow_back_ios_outlined,
                              color: WEBColors.white,
                              size: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '2/4',
                            style: Types.whiteRegular24TStyle.copyWith(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => {},
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: WEBColors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              spacerVertical(12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (var i = 0; i < 3; i++)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                          color: WEBColors.cyan.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        'Design system',
                        style: Types.buttonH4TStyle,
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
        spacerVertical(8),
        Expanded(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Designed the fsd mobile an sdfd web  fsdgfs g of a HR Tech pds gsdroduct for both job seekers and egdfg s s mployers that helps make the ',
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: Types.buttonH4TStyle,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: onExpandedChange,
                        child: Text(
                          '...See more',
                          style: Types.buttonBoltH4TStyle,
                        ),
                      ),
                    ),
                    spacerVertical(8),
                    Expanded(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(
                          sigmaX: !expandedViewEnable ? 0 : 10,
                          sigmaY: !expandedViewEnable ? 0 : 10,
                        ),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () => showFiltersOwerlayDialog(context),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: WEBColors.liteGray.withOpacity(0.1)),
                              ),
                            ),
                            Positioned.fill(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 28),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipOval(
                                        child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          color:
                                              WEBColors.white.withOpacity(0.10),
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
                                          color:
                                              WEBColors.white.withOpacity(0.10),
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
                      ),
                    ),
                  ],
                ),
              ),
              Offstage(
                offstage: !expandedViewEnable,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 65),
                  width: double.infinity,
                  color: WEBColors.nightDarknes,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: 24, left: 24, bottom: 32),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'DESCRIPTION',
                            style: Types.buttonBoltH4TStyle.copyWith(
                                color: WEBColors.white.withOpacity(0.66)),
                          ),
                          spacerVertical(4),
                          Text(
                            'Designed the mobile and web app of a HR Tech product for both job seekers and employers that helps make the recruitment process fun, easy and efficient for all parties.',
                            style: Types.textLinkTStyle.copyWith(
                                color: WEBColors.white.withOpacity(0.66)),
                          ),
                          spacerVertical(4),
                          Text(
                            'I did competitive analysis, market research, user flow, feature creation, prototyping, design systems creation, usability testing for mobile and web app. ',
                            style: Types.textLinkTStyle.copyWith(
                                color: WEBColors.white.withOpacity(0.66)),
                          ),
                          spacerVertical(16),
                          Text(
                            'TEAM',
                            style: Types.buttonBoltH4TStyle.copyWith(
                                color: WEBColors.white.withOpacity(0.66)),
                          ),
                          spacerVertical(4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Vector.users,
                                width: 17,
                                height: 17,
                              ),
                              spacerHorizontal(8),
                              Text(
                                'Engineer: @AlanMatviienko @SofiaYay',
                                style: Types.buttonH4TStyle.copyWith(
                                    color: WEBColors.white.withOpacity(0.66)),
                              ),
                            ],
                          ),
                          spacerVertical(4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Vector.users,
                                width: 17,
                                height: 17,
                              ),
                              spacerHorizontal(8),
                              Text(
                                '3D Designer: @JulianaAfterglow',
                                style: Types.buttonH4TStyle.copyWith(
                                    color: WEBColors.white.withOpacity(0.66)),
                              ),
                            ],
                          ),
                          spacerVertical(16),
                          Text(
                            'DURATION',
                            style: Types.buttonBoltH4TStyle.copyWith(
                                color: WEBColors.white.withOpacity(0.66)),
                          ),
                          spacerVertical(4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Vector.calendar,
                                width: 17,
                                height: 17,
                                color: WEBColors.white,
                              ),
                              spacerHorizontal(8),
                              Text(
                                'Jan 30 2024 - Oct 30 2024',
                                style: Types.buttonH4TStyle.copyWith(
                                    color: WEBColors.white.withOpacity(0.66)),
                              ),
                            ],
                          ),
                          spacerVertical(16),
                          Text(
                            'COMPANY',
                            style: Types.buttonBoltH4TStyle.copyWith(
                                color: WEBColors.white.withOpacity(0.66)),
                          ),
                          spacerVertical(4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Vector.newspaper,
                                width: 17,
                                height: 17,
                              ),
                              spacerHorizontal(8),
                              Text(
                                'iThrive.io',
                                style: Types.buttonH4TStyle.copyWith(
                                    color: WEBColors.white.withOpacity(0.66)),
                              ),
                            ],
                          ),
                          spacerVertical(16),
                          Text(
                            'INDUSTRY',
                            style: Types.buttonBoltH4TStyle.copyWith(
                                color: WEBColors.white.withOpacity(0.66)),
                          ),
                          spacerVertical(4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                Vector.officeBuilding,
                                width: 17,
                                height: 17,
                              ),
                              spacerHorizontal(8),
                              Text(
                                'HR Tech',
                                style: Types.buttonBoltH4TStyle
                                    .copyWith(color: WEBColors.white),
                              ),
                            ],
                          ),
                          spacerVertical(16),
                          Text(
                            'KEYWORDS',
                            style: Types.buttonBoltH4TStyle.copyWith(
                                color: WEBColors.white.withOpacity(0.66)),
                          ),
                          spacerVertical(4),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: [
                              for (var i = 0; i < 3; i++)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 12),
                                  decoration: BoxDecoration(
                                      color: WEBColors.cyan.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    'Mobile App Design',
                                    style: Types.buttonH4TStyle,
                                  ),
                                )
                            ],
                          ),
                          spacerVertical(16),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: onExpandedChange,
                              child: Text(
                                'See less',
                                style: Types.buttonBoltH4TStyle.copyWith(
                                    color: WEBColors.white.withOpacity(0.66)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void showFiltersOwerlayDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CandidateVideoPlayer(),
    );
  }
}
