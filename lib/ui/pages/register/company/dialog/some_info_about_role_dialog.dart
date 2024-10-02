import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/web/decorator/gradient_border_container.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class SomeInfoAboutRoleDialog extends StatelessWidget {
  final Function(bool isConfirm) clickConfirm;
  const SomeInfoAboutRoleDialog({super.key, required this.clickConfirm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GradientBorderContainer(
        child: Container(
          constraints: const BoxConstraints(minWidth: 500, maxWidth: 645),
          decoration: BoxDecoration(
            color: WEBColors.darkDialogGray.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(19)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  Strings.greatNowLetSFillSome,
                  style: Types.headerLogoTStyle,
                  textAlign: TextAlign.center,
                ),
                spacerVertical(8),
                Text(
                  Strings.allOfThisInformationWillHelp,
                  style: Types.grayRegular24TStyle,
                  textAlign: TextAlign.center,
                ),
                spacerVertical(40),
                GradientButton(
                    height: 75,
                    gradientSource: Raster.greenGradient,
                    onClick: () => {Navigator.pop(context), clickConfirm(true)},
                    text: Strings.getStarted),
                spacerVertical(22),
                ClickableTextButton(
                    onClick: () =>
                        {Navigator.pop(context), clickConfirm(false)},
                    text: Strings.doLater,
                    hoveredStyle: Types.buttonH4TStyle,
                    regularStyle: Types.buttonH4TStyle
                        .copyWith(color: WEBColors.white.withOpacity(0.66)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
