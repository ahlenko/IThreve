import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/domain/model/rate_selected.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/fields/autocomplit_text_t_field.dart';
import 'package:ithreve_web/ui/components/selectors/adding_selectable_item.dart';
import 'package:ithreve_web/ui/components/selectors/rate_select_item.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class AdditionCandidateSkillsStep extends StatefulWidget {
  final Function() onNeedNextPage;
  final Function() onNeedPrewPage;
  const AdditionCandidateSkillsStep(
      {super.key, required this.onNeedNextPage, required this.onNeedPrewPage});

  @override
  State<AdditionCandidateSkillsStep> createState() =>
      _AdditionCandidateSkillsStepState();
}

class _AdditionCandidateSkillsStepState
    extends State<AdditionCandidateSkillsStep> {
  bool addOtherSkillEnable = false;

  List<RateSelected> items = [
    RateSelected(title: 'Design System', selected: true, rate: 4),
    RateSelected(title: 'Iconography Design', selected: true, rate: 4),
    RateSelected(title: 'Graphic design'),
    RateSelected(title: 'Branding'),
    RateSelected(title: 'Interaction design'),
  ];

  bool hasSelectedItems() {
    bool hasSelected = false;

    for (RateSelected item in items) {
      if (item.selected == true) {
        hasSelected = true;
      }
    }

    return hasSelected;
  }

  @override
  Widget build(BuildContext context) {
    var width = screenWidth(context);
    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RegularBoltRegularText(
                firstText: Strings.weRecommendThatTheCandidate,
                secondText: ' ${Strings.additionalSkills} ',
                thirdText: Strings.withTheseSkill,
              ),
              spacerVertical(12),
              Text(
                Strings.weVeFilledInSomeInformation,
                style: Types.grayRegular24TStyle,
              ),
              spacerVertical(12),
              Text(
                Strings.youHaveFlexibilityWith,
                style: Types.grayRegular24TStyle,
              ),
              spacerVertical(32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (width < 1160)
                    Offstage(
                      offstage: !hasSelectedItems(),
                      child: Text(
                        '${Strings.skillUpr}/${Strings.levelUpr}',
                        style: Types.buttonBoltH4TStyle
                            .copyWith(color: WEBColors.white.withOpacity(0.66)),
                      ),
                    )
                  else
                    Offstage(
                      offstage: !hasSelectedItems(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 3,
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                Strings.skillUpr,
                                style: Types.buttonBoltH4TStyle.copyWith(
                                    color: WEBColors.white.withOpacity(0.66)),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 6,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 650),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  Strings.levelUpr,
                                  style: Types.buttonBoltH4TStyle.copyWith(
                                      color: WEBColors.white.withOpacity(0.66)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  Offstage(
                      offstage: !hasSelectedItems(), child: spacerVertical(16)),
                  if (width < 1160)
                    for (RateSelected item in items)
                      if (item.selected)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: width < 535
                                  ? CrossAxisAlignment.center
                                  : CrossAxisAlignment.start,
                              children: [
                                SelectableItem(
                                    item: item,
                                    onChangeSelection: () => setState(() {
                                          item.selected = !item.selected;
                                        })),
                                spacerVertical(20),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: width < 535 ? 240 : 650),
                                  child: RateSelectedItem(
                                      minGrade: Strings.beginner,
                                      maxGrade: Strings.expert,
                                      enableCompactMode: width < 810,
                                      item: item,
                                      onRated: (rate) => setState(() {
                                            item.rate = rate;
                                          })),
                                ),
                                spacerVertical(35),
                              ],
                            ),
                          ),
                        ),
                  if (width >= 1160)
                    for (RateSelected item in items)
                      if (item.selected)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 3,
                                child: SelectableItem(
                                    item: item,
                                    onChangeSelection: () => setState(() {
                                          item.selected = !item.selected;
                                        })),
                              ),
                              Flexible(
                                flex: 6,
                                child: ConstrainedBox(
                                  constraints:
                                      const BoxConstraints(maxWidth: 650),
                                  child: RateSelectedItem(
                                      minGrade: Strings.beginner,
                                      maxGrade: Strings.expert,
                                      enableCompactMode: width < 1000,
                                      item: item,
                                      onRated: (rate) => setState(() {
                                            item.rate = rate;
                                          })),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
              spacerVertical(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Strings.suggestedUpr,
                    style: Types.buttonBoltH4TStyle
                        .copyWith(color: WEBColors.white.withOpacity(0.66)),
                  ),
                  spacerVertical(8),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      for (RateSelected item in items)
                        if (!item.selected)
                          SelectableItem(
                              item: item,
                              onChangeSelection: () => setState(() {
                                    item.selected = !item.selected;
                                  })),
                      SelectableItem(
                          item: RateSelected(
                              title: Strings.other,
                              selected: addOtherSkillEnable),
                          onChangeSelection: () => setState(() {
                                addOtherSkillEnable = !addOtherSkillEnable;
                              }))
                    ],
                  )
                ],
              ),
              spacerVertical(24),
              Offstage(
                offstage: !addOtherSkillEnable,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.otherUpr,
                      style: Types.buttonBoltH4TStyle
                          .copyWith(color: WEBColors.white.withOpacity(0.66)),
                    ),
                    AutocomplitTextTField(
                      fontSize: 24,
                      clearSubmittedText: true,
                      hintText: Strings.typeHere,
                      onChanged: (value) => {},
                      onSubmitted: (value) => {
                        setState(() {
                          items.add(RateSelected(title: value, selected: true));
                        }),
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Row(
                  children: [
                    GradientButton(
                        height: 75,
                        horizontalSpacer: 54,
                        gradientSource: Raster.greenGradient,
                        onClick: () => {widget.onNeedNextPage()},
                        text: Strings.next),
                    spacerHorizontal(32),
                    ClickableTextButton(
                        onClick: () => widget.onNeedPrewPage(),
                        text: Strings.back,
                        hoveredStyle: Types.textFieldTitleTStyle
                            .copyWith(color: WEBColors.white),
                        regularStyle: Types.textFieldTitleTStyle)
                  ],
                ),
              )
            ]));
  }
}
