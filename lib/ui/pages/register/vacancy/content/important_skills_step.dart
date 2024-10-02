import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/domain/model/rate_selected.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/selectors/rate_select_item.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class ImportantSkillsStep extends StatefulWidget {
  final Function() onNeedNextPage;
  final Function() onNeedPrewPage;
  const ImportantSkillsStep(
      {super.key, required this.onNeedNextPage, required this.onNeedPrewPage});

  @override
  State<ImportantSkillsStep> createState() => _ImportantSkillsStepState();
}

class _ImportantSkillsStepState extends State<ImportantSkillsStep> {
  bool addOtherSkillEnable = false;

  List<RateSelected> items = [
    RateSelected(title: 'Logistics', rate: 4),
    RateSelected(title: 'Core Skillsets', rate: 4),
    RateSelected(title: 'Additional/Nice-To-Have Skillsets'),
    RateSelected(title: 'Personality'),
    RateSelected(title: 'Values/Mission'),
  ];

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
                firstText: Strings.howImportantIsEachElements,
              ),
              spacerVertical(12),
              Text(
                Strings.maybeSomeCompaniesCanBeA,
                style: Types.grayRegular24TStyle,
              ),
              spacerVertical(56),
              Column(
                crossAxisAlignment: width < 535
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  for (RateSelected item in items)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 65),
                      child: Align(
                        alignment: width < 535
                            ? Alignment.center
                            : Alignment.centerLeft,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxWidth: width < 535 ? 240 : 650),
                          child: RateSelectedItem(
                              minGrade: Strings.negotiable,
                              showTitle: true,
                              enableCompactMode: width < 810,
                              maxGrade: Strings.veryImportant,
                              item: item,
                              onRated: (rate) => setState(() {
                                    item.rate = rate;
                                  })),
                        ),
                      ),
                    ),
                ],
              ),
              Row(
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
              )
            ]));
  }
}
