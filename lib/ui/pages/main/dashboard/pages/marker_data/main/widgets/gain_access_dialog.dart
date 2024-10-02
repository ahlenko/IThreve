import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class GainAccessDialog extends StatelessWidget {
  const GainAccessDialog({
    required this.onClosed,
    super.key,
  });
  final VoidCallback onClosed;

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
                      Strings.gainAccessPage,
                      style: Types.headerLogoTStyle.copyWith(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    spacerVertical(16),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: Strings.gainAccessPageDescription,
                            style: Types.headerItemTStyle.copyWith(
                                color: WEBColors.white.withOpacity(0.66)),
                          ),
                          TextSpan(
                            text: Strings.here,
                            style: Types.headerBoldButtonTStyle.copyWith(
                              color: WEBColors.white.withOpacity(0.66),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    spacerVertical(16),
                    Text(
                      Strings.gainAccessPageContent,
                      style: Types.headerItemTStyle.copyWith(
                        color: WEBColors.white.withOpacity(0.66),
                      ),
                    ),
                    spacerVertical(32),
                    SizedBox(
                      height: 112,
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
                          onClosed();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                Strings.gainAccessPageButton,
                                style: Types.whiteBottonTStyle.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Vector.currencyYen,
                                  ),
                                  Text(
                                    '25',
                                    style: Types.whiteBottonTStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    spacerVertical(16),
                    ClickableTextButton(
                      onClick: () => context.pop(),
                      text: Strings.gainAccessPageFooter,
                      hoveredStyle: Types.buttonH4TStyle.copyWith(fontSize: 20),
                      regularStyle: Types.buttonH4TStyle.copyWith(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        decorationColor: WEBColors.white,
                      ),
                    ),
                    spacerVertical(16),
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
