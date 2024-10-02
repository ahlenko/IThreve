import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class CompleteCreateVacancyStep extends StatelessWidget {
  final Function() onNeedNextPage;
  final String currentRole;
  final String? nextRole;
  final Function() addAnotherVacancyInfo;
  const CompleteCreateVacancyStep(
      {super.key,
      required this.onNeedNextPage,
      required this.addAnotherVacancyInfo,
      required this.currentRole,
      required this.nextRole});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RegularBoltRegularText(
                firstText: Strings.awesomeYouReAllSetForThe,
                secondText: ' $currentRole ',
                thirdText: '${Strings.role}. ',
                anotherText: nextRole != null
                    ? '${Strings.wouldYouLikeToFill} ${nextRole!}'
                    : null,
              ),
              spacerVertical(12),
              Text(
                Strings.youCanEditAnyOfThese,
                style: Types.grayRegular24TStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: Row(
                  children: [
                    GradientButton(
                        height: 75,
                        horizontalSpacer: 54,
                        gradientSource: Raster.greenGradient,
                        onClick: () => {
                              if (nextRole != null)
                                {addAnotherVacancyInfo()}
                              else
                                {onNeedNextPage()}
                            },
                        text: nextRole != null
                            ? Strings.next
                            : Strings.goToMyDashboard),
                    spacerHorizontal(32),
                    Offstage(
                      offstage: nextRole == null,
                      child: ClickableTextButton(
                          onClick: () => onNeedNextPage(),
                          text: Strings.goToMyDashboard,
                          hoveredStyle: Types.textFieldTitleTStyle
                              .copyWith(color: WEBColors.white),
                          regularStyle: Types.textFieldTitleTStyle),
                    )
                  ],
                ),
              )
            ]));
  }
}
