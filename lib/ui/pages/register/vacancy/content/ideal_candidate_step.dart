import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/fields/regular_text_field.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class IdealCandidateStep extends StatefulWidget {
  final Function() onNeedNextPage;
  final Function() onNeedPrewPage;
  final String candidateRole;
  const IdealCandidateStep(
      {super.key,
      required this.onNeedNextPage,
      required this.onNeedPrewPage,
      required this.candidateRole});

  @override
  State<IdealCandidateStep> createState() => _IdealCandidateStepState();
}

class _IdealCandidateStepState extends State<IdealCandidateStep> {
  TextEditingController textCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RegularBoltRegularText(
                firstText: Strings.describeWhatThatPerfect,
                secondText: ' ${widget.candidateRole} ',
                thirdText: Strings.wouldBeLike,
              ),
              spacerVertical(12),
              Text(
                Strings.thisIncludesPersonality,
                style: Types.grayRegular24TStyle,
              ),
              spacerVertical(65),
              RegularTextField(
                fontSize: 32,
                hintText: Strings.typeHere,
                controller: textCtrl,
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
