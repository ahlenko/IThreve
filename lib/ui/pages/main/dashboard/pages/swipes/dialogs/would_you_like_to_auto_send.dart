import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class WouldYouLikeToAutoSend extends StatefulWidget {
  final Function(String, bool) clickConfirm;
  const WouldYouLikeToAutoSend({super.key, required this.clickConfirm});

  @override
  State<WouldYouLikeToAutoSend> createState() => _WouldYouLikeToAutoSendState();
}

class _WouldYouLikeToAutoSendState extends State<WouldYouLikeToAutoSend> {
  TextEditingController controller = TextEditingController();
  bool turnThisOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WEBColors.white.withOpacity(0.1),
        body: Center(
          child: Container(
              constraints: const BoxConstraints(minWidth: 480, maxWidth: 550),
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
                        'Would you like to automatically send them a message communicating your interest in them as a candidate? ',
                        style: Types.whiteBottonTStyle,
                        textAlign: TextAlign.center,
                      ),
                      spacerVertical(16),
                      Text(
                        'If so, then as soon as you swipe left, then the message below will be sent to them as a direct message.',
                        style: Types.headerItemTStyle
                            .copyWith(color: WEBColors.white.withOpacity(0.66)),
                        textAlign: TextAlign.center,
                      ),
                      spacerVertical(32),
                      Stack(
                        children: [
                          Positioned.fill(
                              child: Container(
                            decoration: BoxDecoration(
                                color: WEBColors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                          )),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: TextFormField(
                              cursorColor: WEBColors.cyan,
                              controller: controller,
                              minLines: 5,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  hintText: 'Hi, we’d love to talk more!',
                                  border: InputBorder.none,
                                  hintStyle: Types.textFieldTStyle
                                      .copyWith(fontSize: 24)),
                              style: Types.textFieldTStyle.copyWith(
                                  color: WEBColors.white, fontSize: 24),
                            ),
                          ),
                        ],
                      ),
                      spacerVertical(32),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => setState(() {
                            turnThisOff = !turnThisOff;
                          }),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: turnThisOff,
                                  onChanged: (selected) => setState(() {
                                        turnThisOff = selected ?? false;
                                      })),
                              Text(
                                'Turn this off',
                                style: Types.headerItemTStyle,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      spacerVertical(16),
                      GradientButton(
                          height: 75,
                          gradientSource: Raster.greenGradient,
                          onClick: () => {
                                Navigator.pop(context),
                                widget.clickConfirm(
                                    controller.text, turnThisOff)
                              },
                          text: Strings.okay),
                      spacerVertical(22),
                      ClickableTextButton(
                          onClick: () => Navigator.pop(context),
                          text: Strings.cancel,
                          hoveredStyle:
                              Types.buttonH4TStyle.copyWith(fontSize: 20),
                          regularStyle: Types.buttonH4TStyle.copyWith(
                              fontSize: 20,
                              color: WEBColors.white.withOpacity(0.66)))
                    ],
                  ))),
        ));
  }
}
