import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/fields/autocomplit_text_t_field.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class AddJobLinkStep extends StatefulWidget {
  final Function() onNeedNextPage;
  const AddJobLinkStep({super.key, required this.onNeedNextPage});

  @override
  State<AddJobLinkStep> createState() => _AddJobLinkStepState();
}

class _AddJobLinkStepState extends State<AddJobLinkStep> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RegularBoltRegularText(
                firstText: Strings.isThereALinkToAJob,
              ),
              spacerVertical(12),
              Text(
                Strings.maybeYouAlreadyHavePreMade,
                style: Types.grayRegular24TStyle,
              ),
              spacerVertical(65),
              AutocomplitTextTField(
                clearSubmittedText: false,
                hintText: Strings.typeHere,
                onChanged: (value) => {},
                onSubmitted: (value) => {},
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
                        onClick: () => widget.onNeedNextPage(),
                        text: Strings.skip,
                        hoveredStyle: Types.textFieldTitleTStyle
                            .copyWith(color: WEBColors.white),
                        regularStyle: Types.textFieldTitleTStyle)
                  ],
                ),
              ),
            ]));
  }
}
