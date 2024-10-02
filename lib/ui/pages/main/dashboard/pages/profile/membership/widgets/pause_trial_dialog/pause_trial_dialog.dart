import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class PauseTrialDialog extends StatelessWidget {
  const PauseTrialDialog({
    required this.onChangeDialog,
    required this.onShowCommentDialog,
    super.key,
  });
  final void Function(bool value) onChangeDialog;
  final VoidCallback onShowCommentDialog;

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    Strings.stopMembershipDialogTitle,
                    style: Types.headerLogoTStyle.copyWith(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  spacerVertical(16),
                  Text(
                   Strings.stopMembershipDialogDescription,
                    style: Types.buttonH4TStyle
                        .copyWith(color: WEBColors.white.withOpacity(0.66)),
                    textAlign: TextAlign.center,
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
                        onShowCommentDialog();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        child: Text(
                          Strings.pauseMembership,
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
                      regularStyle: Types.buttonH4TStyle
                          .copyWith(fontSize: 20)
                          .copyWith(color: WEBColors.white.withOpacity(0.66))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
