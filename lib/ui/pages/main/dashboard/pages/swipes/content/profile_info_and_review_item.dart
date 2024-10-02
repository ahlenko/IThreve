import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/content/stories/candidate_stories_player.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class ProfileInfoAndReviewItem extends StatelessWidget {
  const ProfileInfoAndReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight - 186,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CandidateProfileBox(),
                spacerVertical(24),
                const SendMessageBox(),
                spacerVertical(24),
                Text(Strings.whatAreYourInitialReactions,
                    style: Types.textLinkTStyle.copyWith(
                      color: WEBColors.white,
                    )),
                spacerVertical(8),
                ReviewBox(boxName: Strings.skillUpr),
                spacerVertical(8),
                ReviewBox(boxName: Strings.personalityUpr),
                spacerVertical(8),
                ReviewBox(boxName: Strings.otherUpr),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CandidateProfileBox extends StatefulWidget {
  const CandidateProfileBox({super.key});

  @override
  State<CandidateProfileBox> createState() => _CandidateProfileBoxState();
}

class _CandidateProfileBoxState extends State<CandidateProfileBox>
    with AfterLayoutMixin {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 24, bottom: 12, left: 16, right: 16),
      decoration: BoxDecoration(
          color: WEBColors.drawerColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: Container(
                  width: 60,
                  height: 60,
                  color: WEBColors.liteGray,
                ),
              ),
              spacerHorizontal(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ayana Terauchi',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Types.headerLogoTStyle
                            .copyWith(fontWeight: FontWeight.normal)),
                    Text('Product Designer',
                        overflow: TextOverflow.ellipsis,
                        style: Types.headerItemTStyle.copyWith(
                            color: WEBColors.white.withOpacity(0.66))),
                  ],
                ),
              )
            ],
          ),
          spacerVertical(12),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: WEBColors.nightDarknes,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        Vector.star,
                        width: 20,
                        height: 20,
                      ),
                      spacerHorizontal(4),
                      Text('Rare combo',
                          style: Types.buttonH4TStyle.copyWith(
                            color: WEBColors.fontWhite,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
          spacerVertical(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Passionate',
                  style: Types.textLinkTStyle
                      .copyWith(color: WEBColors.white.withOpacity(0.66))),
              Text('•',
                  style: Types.textLinkTStyle
                      .copyWith(color: WEBColors.white.withOpacity(0.66))),
              Text('Determined',
                  style: Types.textLinkTStyle
                      .copyWith(color: WEBColors.white.withOpacity(0.66))),
              Text('•',
                  style: Types.textLinkTStyle
                      .copyWith(color: WEBColors.white.withOpacity(0.66))),
              Text('Creative',
                  style: Types.textLinkTStyle
                      .copyWith(color: WEBColors.white.withOpacity(0.66)))
            ],
          ),
          spacerVertical(16),
          SizedBox(
            height: 78,
            child: Scrollbar(
              controller: _scrollController,
              child: ListView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                children: [
                  for (var i = 0; i < 6; i++)
                    Row(
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () => showFiltersOwerlayDialog(context),
                            child: Column(
                              children: [
                                ClipOval(
                                  child: Container(
                                    width: 48,
                                    height: 48,
                                    color: WEBColors.liteGray,
                                  ),
                                ),
                                spacerVertical(4),
                                Text('Creative',
                                    style: Types.textLinkTStyle.copyWith(
                                        fontSize: 12,
                                        color:
                                            WEBColors.white.withOpacity(0.66)))
                              ],
                            ),
                          ),
                        ),
                        if (i != 5) spacerHorizontal(30),
                      ],
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showFiltersOwerlayDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CandidateStoriesPlayer(),
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    showFiltersOwerlayDialog(context);
  }
}

class SendMessageBox extends StatelessWidget {
  const SendMessageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
          color: WEBColors.drawerColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(Vector.message),
              spacerHorizontal(6),
              Text('${Strings.sendAMessageTo} Ayana',
                  style: Types.headerItemTStyle
                      .copyWith(color: WEBColors.fontWhite))
            ],
          ),
          spacerVertical(16),
          MultilineTextField(
            controller: TextEditingController(),
            hintText: Strings.writeAMessage,
            withSendButton: true,
          )
        ],
      ),
    );
  }
}

class ReviewBox extends StatelessWidget {
  final String boxName;
  const ReviewBox({super.key, required this.boxName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
          color: WEBColors.drawerColor, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(boxName,
                  style: Types.buttonBoltH4TStyle.copyWith(
                      fontSize: 14, color: WEBColors.white.withOpacity(0.66))),
              RatingBar(
                onRatingChange: (p0) => {},
                rating: 0,
              )
            ],
          ),
          spacerVertical(8),
          MultilineTextField(
            controller: TextEditingController(),
            hintText: Strings.typeHere,
          )
        ],
      ),
    );
  }
}

class RatingBar extends StatefulWidget {
  final int rating;
  final Function(int) onRatingChange;
  const RatingBar(
      {super.key, required this.rating, required this.onRatingChange});

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  List<bool> ratingHovered = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < ratingHovered.length; i++)
          Row(
            children: [
              MouseRegion(
                onEnter: (_) => setState(() {
                  for (var v = 0; v < ratingHovered.length; v++) {
                    if (v <= i) {
                      ratingHovered[v] = true;
                    }
                  }
                }),
                onExit: (_) => setState(() {
                  for (var v = 0; v < ratingHovered.length; v++) {
                    if (v <= i) {
                      ratingHovered[v] = false;
                    }
                  }
                }),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => widget.onRatingChange(i + 1),
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: i != ratingHovered.length - 1 ? 4 : 0),
                    child: SvgPicture.asset(
                      i < widget.rating ? Vector.starChecked : Vector.star,
                      width: 24,
                      height: 24,
                      color: i < widget.rating
                          ? null
                          : ratingHovered[i]
                              ? WEBColors.cyan
                              : null,
                    ),
                  ),
                ),
              ),
            ],
          )
      ],
    );
  }
}

class MultilineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool withSendButton;
  final Function(String)? onEnter;

  const MultilineTextField({
    super.key,
    this.hintText,
    this.onEnter,
    this.withSendButton = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: WEBColors.nightDarknes,
          ),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            onChanged: (value) {
              onEnter!(value);
            },
            maxLines: 10,
            minLines: withSendButton ? 1 : 2,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\n')),
            ],
            cursorColor: WEBColors.cyan,
            controller: controller,
            decoration: InputDecoration(
                suffixIconConstraints:
                    const BoxConstraints(maxHeight: 45, maxWidth: 45),
                suffixIcon: withSendButton
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            child: SvgPicture.asset(
                              Vector.arrowUp,
                            ),
                          ),
                        ),
                      )
                    : null,
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: Types.textFieldTStyle.copyWith(fontSize: 20)),
            style: Types.textFieldTStyle
                .copyWith(color: WEBColors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
