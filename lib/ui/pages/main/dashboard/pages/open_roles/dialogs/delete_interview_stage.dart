import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class DeleteInterviewStage extends StatelessWidget {
  const DeleteInterviewStage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: EdgeInsets.only(
            left: (screenWidth(context) > UiConst.adaptiveWidth
                    ? UiConst.drawerWidth
                    : UiConst.drawerWidthCompact) +
                15,
            right: 15),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 400, maxWidth: 450),
            decoration: const BoxDecoration(
              color: WEBColors.lightNightDark,
              borderRadius: BorderRadius.all(Radius.circular(19)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 40, bottom: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    Strings.areYouSureThatYouWantToDeleteThisStage,
                    style: Types.headerLogoTStyle.copyWith(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  spacerVertical(16),
                  Text(
                    Strings.allOfTheApplicantsIn,
                    style: Types.buttonH4TStyle
                        .copyWith(color: WEBColors.white.withOpacity(0.66)),
                    textAlign: TextAlign.center,
                  ),
                  spacerVertical(40),
                  GradientButton(
                      height: 75,
                      gradientSource: Raster.greenGradient,
                      onClick: () => {Navigator.pop(context)},
                      text: Strings.okay),
                  spacerVertical(16),
                  ClickableTextButton(
                      onClick: () => {
                            Navigator.pop(context),
                          },
                      text: Strings.cancel,
                      hoveredStyle: Types.buttonH4TStyle.copyWith(fontSize: 20),
                      regularStyle: Types.buttonH4TStyle
                          .copyWith(fontSize: 20)
                          .copyWith(color: WEBColors.white.withOpacity(0.66))),
                  spacerVertical(16),
                  alreadyDontHaveAccount(false, () => {},
                      firstText: Strings.doYouWantToRenameTheStageInstead,
                      secondText: Strings.renameTheStage,
                      textSize: 14)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
