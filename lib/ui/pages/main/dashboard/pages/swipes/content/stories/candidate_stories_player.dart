import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class CandidateStoriesPlayer extends StatefulWidget {
  const CandidateStoriesPlayer({super.key});

  @override
  State<CandidateStoriesPlayer> createState() => _CandidateStoriesPlayerState();
}

class _CandidateStoriesPlayerState extends State<CandidateStoriesPlayer> {
  bool commentsExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70, left: UiConst.drawerWidthCompact),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 13, 13, 14),
        body: Padding(
          padding: const EdgeInsets.only(left: 40, bottom: 24, right: 40),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  flex: !commentsExpanded ? 0 : 1,
                  child: SizedBox(
                    width: !commentsExpanded ? 1 : double.infinity,
                  )),
              Flexible(
                flex: 1,
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
                      child: Offstage(
                        offstage: commentsExpanded,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                    child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      Vector.heartRegular,
                                      color: WEBColors.white,
                                    ),
                                    const Text(
                                      '10',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12.5),
                                    )
                                  ],
                                )),
                              ),
                              spacerVertical(20),
                              MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      commentsExpanded = !commentsExpanded;
                                    }),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          Vector.chat,
                                          color: WEBColors.white,
                                        ),
                                        const Text(
                                          '57',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.5),
                                        )
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 28,
                        left: 28,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                for (var i = 0; i < 4; i++)
                                  Container(
                                    width: 312,
                                    margin:
                                        EdgeInsets.only(right: i < 3 ? 15 : 0),
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: WEBColors.white
                                            .withOpacity(i == 0 ? 1 : 0.33),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                              ],
                            ),
                            spacerVertical(10),
                            Row(
                              children: [
                                MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: const Icon(
                                          Icons.close_rounded,
                                          color: WEBColors.fontWhite,
                                          size: 36,
                                        ))),
                                spacerHorizontal(10),
                                Text(
                                  'Intro',
                                  style: Types.headerLogoTStyle,
                                )
                              ],
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Flexible(
                  flex: !commentsExpanded ? 0 : 1,
                  child: SizedBox(
                    width: !commentsExpanded ? 1 : double.infinity,
                    child: Offstage(
                      offstage: !commentsExpanded,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 32, right: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Intro',
                                      style: Types.whiteBottonTStyle,
                                    ),
                                    spacerHorizontal(16),
                                    Text(
                                      '12',
                                      style: Types.headerItemTStyle.copyWith(
                                          color: WEBColors.white
                                              .withOpacity(0.66)),
                                    ),
                                  ],
                                ),
                                MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                        onTap: () => setState(() {
                                              commentsExpanded =
                                                  !commentsExpanded;
                                            }),
                                        child: const Icon(
                                          Icons.close_rounded,
                                          color: WEBColors.fontWhite,
                                        ))),
                              ],
                            ),
                            spacerVertical(24),
                            const Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommentItem(),
                                      CommentItem(),
                                      CommentItem(),
                                      CommentItem(),
                                      CommentItem(),
                                      CommentItem(),
                                      CommentItem(),
                                      CommentItem(),
                                      CommentItem(),
                                      CommentItem(),
                                      CommentItem(),
                                      CommentItem()
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentItem extends StatefulWidget {
  const CommentItem({super.key});

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Container(
            width: 60,
            height: 60,
            color: WEBColors.fontWhite,
          ),
        ),
        spacerHorizontal(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Test',
                    style: Types.headerItemTStyle,
                  ),
                  Text(
                    '5 days ago',
                    style: Types.textLinkTStyle
                        .copyWith(color: WEBColors.white.withOpacity(0.66)),
                  )
                ],
              ),
              spacerVertical(4),
              Text(
                  'I love that you love doing this in your free time! Would love to hear more about this!',
                  style: Types.buttonH4TStyle),
              spacerVertical(8.5),
              Row(
                children: [
                  SvgPicture.asset(Vector.like),
                  spacerHorizontal(2),
                  Text('75',
                      style: Types.buttonH4TStyle
                          .copyWith(fontWeight: FontWeight.w300)),
                  spacerHorizontal(16),
                  Text('Reply',
                      style: Types.buttonBoltH4TStyle.copyWith(
                          fontSize: 14,
                          color: WEBColors.white.withOpacity(0.66))),
                ],
              ),
              spacerVertical(13),
              Row(
                children: [
                  SvgPicture.asset(
                    Vector.arrowDown,
                    color: WEBColors.darkGreen,
                  ),
                  spacerHorizontal(8),
                  Text('3 replies',
                      style: Types.buttonBoltH4TStyle
                          .copyWith(color: WEBColors.darkGreen)),
                ],
              ),
              spacerVertical(15),
            ],
          ),
        )
      ],
    );
  }
}
