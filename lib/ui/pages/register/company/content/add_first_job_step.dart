import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/web/decorator/regular_bolt_regular_text.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class AddFirstJobStep extends StatelessWidget {
  final Function() onNeedNextPage;
  const AddFirstJobStep({super.key, required this.onNeedNextPage});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RegularBoltRegularText(
                firstText: Strings.letSAddYourFirstJob,
              ),
              spacerVertical(12),
              Text(
                Strings.maybeYouWantToAddAJob,
                style: Types.grayRegular24TStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65),
                child: GradientButton(
                    height: 75,
                    horizontalSpacer: 54,
                    gradientSource: Raster.greenGradient,
                    onClick: () => {onNeedNextPage()},
                    text: Strings.next),
              ),
            ]));
  }
}
