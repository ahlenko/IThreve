import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class LetsGetSwipingDialog extends StatelessWidget {
  const LetsGetSwipingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WEBColors.white.withOpacity(0.1),
        body: Center(
          child: Container(
              constraints: const BoxConstraints(minWidth: 480, maxWidth: 480),
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
                        'Let’s get swiping!',
                        style: Types.whiteBottonTStyle,
                        textAlign: TextAlign.center,
                      ),
                      spacerVertical(40),
                      Text(
                        'To swipe, use the right and left keypad or left!',
                        style: Types.headerItemTStyle
                            .copyWith(color: WEBColors.white.withOpacity(0.66)),
                        textAlign: TextAlign.center,
                      ),
                      spacerVertical(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: WEBColors.white,
                          ),
                          spacerHorizontal(16),
                          const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: WEBColors.white,
                          )
                        ],
                      ),
                      spacerVertical(40),
                      GradientButton(
                          height: 75,
                          gradientSource: Raster.greenGradient,
                          onClick: () => Navigator.pop(context),
                          text: Strings.okay),
                    ],
                  ))),
        ));
  }
}
