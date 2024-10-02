import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class AutoMessageSendDialog extends StatelessWidget {
  const AutoMessageSendDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        Strings.automaticInterestMessage,
                        style: Types.buttonH4TStyle,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Switch(
                              value: true,
                              activeColor: WEBColors.white,
                              activeTrackColor: WEBColors.cyan,
                              onChanged: (value) => {})),
                    ],
                  ),
                ),
                Container(
                    constraints:
                        const BoxConstraints(minWidth: 480, maxWidth: 550),
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
                              'Do you want to automatically send a message to the candidate you swipe right to?',
                              style: Types.whiteBottonTStyle,
                              textAlign: TextAlign.center,
                            ),
                            spacerVertical(40),
                            Text(
                              'By turning on the toggle, the candidates you swipe right on will be sent a quick message, communicating your interest in them.',
                              style: Types.headerItemTStyle.copyWith(
                                  color: WEBColors.white.withOpacity(0.66)),
                              textAlign: TextAlign.center,
                            ),
                            spacerVertical(40),
                            GradientButton(
                                height: 75,
                                gradientSource: Raster.greenGradient,
                                onClick: () => Navigator.pop(context),
                                text: Strings.okay),
                          ],
                        ))),
              ],
            ),
          ),
        ));
  }
}
