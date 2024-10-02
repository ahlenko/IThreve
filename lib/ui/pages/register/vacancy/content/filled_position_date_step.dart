import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/fields/data_input_field.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';
import 'package:ithreve_web/ui/utils/text_util.dart';

class FilledPositionDateStep extends StatefulWidget {
  final Function() onNeedNextPage;
  final Function() onNeedPrewPage;
  const FilledPositionDateStep(
      {super.key, required this.onNeedNextPage, required this.onNeedPrewPage});

  @override
  State<FilledPositionDateStep> createState() => _FilledPositionDateStepState();
}

class _FilledPositionDateStepState extends State<FilledPositionDateStep> {
  bool flexibleAtAll = true;
  int enterMonth = 0, enterDay = 0, enterYear = 0;
  String? dateError;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RegularBoltRegularText(
                firstText: Strings.byWhichDateWouldYouLike,
              ),
              spacerVertical(65),
              DataInputField(
                error: dateError,
                errorType: dateError != null ? 'a' : null,
                onInputChange: (month, day, year) {
                  enterMonth = month;
                  enterDay = day;
                  enterYear = year;
                  setState(() {
                    dateError = null;
                  });
                },
                onNeedChecking: () => {
                  if (!TextUtil.isValidFutureDate(
                      enterMonth, enterDay, enterYear))
                    setState(() {
                      dateError = 'Incorect future date';
                    })
                  else
                    widget.onNeedNextPage()
                },
              ),
              spacerVertical(65),
              Row(
                children: [
                  Text(
                    Strings.isThisFlexibleAtAll,
                    style: Types.textFieldTitleTStyle,
                  ),
                  spacerHorizontal(40),
                  Switch(
                      value: flexibleAtAll,
                      activeColor: WEBColors.white,
                      activeTrackColor: WEBColors.cyan,
                      onChanged: (value) => setState(() {
                            flexibleAtAll = value;
                          })),
                ],
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
                              if (!TextUtil.isValidFutureDate(
                                  enterMonth, enterDay, enterYear))
                                setState(() {
                                  dateError = 'Incorect future date';
                                })
                              else
                                widget.onNeedNextPage()
                            },
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
