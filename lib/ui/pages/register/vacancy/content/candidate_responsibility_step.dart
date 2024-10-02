import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/fields/regular_text_field.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class CandidateResponsibilityStep extends StatefulWidget {
  final Function() onNeedNextPage;
  final Function() onNeedPrewPage;
  const CandidateResponsibilityStep(
      {super.key, required this.onNeedNextPage, required this.onNeedPrewPage});

  @override
  State<CandidateResponsibilityStep> createState() =>
      _CandidateResponsibilityStepState();
}

class _CandidateResponsibilityStepState
    extends State<CandidateResponsibilityStep> {
  TextEditingController textCtrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<String> enteredText = [
    'Work with the marketing and the product team to enhance the branding and to ensure cohesiveness with the branding throughout the whole user touch points with the company.'
  ];

  _addEnteredToList() {
    if (textCtrl.text.isNotEmpty && !enteredText.contains(textCtrl.text)) {
      setState(() {
        enteredText.add(textCtrl.text);
      });
    }
    textCtrl.text = '';
  }

  _removeEnteredItem(String item) {
    setState(() {
      enteredText.remove(item);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (event) => {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) _addEnteredToList()
      },
      child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RegularBoltRegularText(
                  firstText: Strings.whatKindOf,
                  secondText: ' ${Strings.effectOnTheBusiness} ',
                  thirdText: Strings.wouldTheIdealCandidateHaveOrWhat,
                ),
                Offstage(
                  offstage: enteredText.isNotEmpty,
                  child: Column(
                    children: [
                      spacerVertical(12),
                      Text(
                        Strings.thisCanIncludeInfluenceOnTheTeam,
                        style: Types.grayRegular24TStyle,
                      ),
                    ],
                  ),
                ),
                spacerVertical(65),
                RegularTextField(
                  fontSize: 32,
                  withSpacer: false,
                  hintText: Strings.typeHere,
                  controller: textCtrl,
                ),
                spacerVertical(13),
                Flexible(
                  child: Column(
                    children: [
                      for (String item in enteredText)
                        _EnteredTextItem(
                            text: item,
                            onRemove: () => _removeEnteredItem(item))
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
              ])),
    );
  }
}

class _EnteredTextItem extends StatelessWidget {
  final String text;
  final Function() onRemove;
  const _EnteredTextItem({required this.onRemove, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: WEBColors.white.withOpacity(0.1),
      ),
      child: Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                text,
                style: Types.whiteRegular24TStyle.copyWith(fontSize: 24),
              ),
            ),
            spacerHorizontal(35),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                  onTap: () => onRemove(),
                  child: SvgPicture.asset(Vector.closeRound)),
            )
          ],
        ),
      ),
    );
  }
}
