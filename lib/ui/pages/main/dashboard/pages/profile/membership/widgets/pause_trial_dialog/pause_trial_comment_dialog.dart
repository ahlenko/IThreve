import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class PauseTrialCommentDialog extends StatelessWidget {
  const PauseTrialCommentDialog({super.key});

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
            decoration: BoxDecoration(
              color: WEBColors.white.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(19)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 40, bottom: 40),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Strings.membershipPaused,
                      style: Types.headerLogoTStyle.copyWith(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    spacerVertical(16),
                    Text(
                      Strings.membershipPausedDescription,
                      style: Types.buttonH4TStyle
                          .copyWith(color: WEBColors.white.withOpacity(0.66)),
                      textAlign: TextAlign.center,
                    ),
                    spacerVertical(40),
                    TextField(
                      maxLines: null,
                      minLines: 5,
                      style: Types.whiteRegular24TStyle,
                      decoration: InputDecoration(
                        hintText: Strings.typeHere,
                        hintStyle: Types.grayRegular24TStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: WEBColors.white.withOpacity(0.1),
                      ),
                    ),
                    spacerVertical(40),
                    SizedBox(
                      height: 72,
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: WEBColors.darkGreen,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          context.pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                          ),
                          child: Text(
                            Strings.receiveCoins.tr(namedArgs: {'coins': '30'}),
                            style: Types.whiteBottonTStyle,
                          ),
                        ),
                      ),
                    ),
                    spacerVertical(16),
                    ClickableTextButton(
                      onClick: () => context.pop(),
                      text: Strings.cancel,
                      hoveredStyle: Types.buttonH4TStyle.copyWith(fontSize: 20),
                      regularStyle: Types.buttonH4TStyle.copyWith(
                        fontSize: 20,
                        color: WEBColors.white.withOpacity(
                          0.66,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
