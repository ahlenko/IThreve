import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

Widget verticalLine(double width, Color color, {double? height}) {
  return Container(width: width, color: color, height: height);
}

Widget horizontalLine(double width, Color color) {
  return Container(height: width, color: color);
}

Widget orHorizontalLine() {
  return Row(
    children: [
      Expanded(child: horizontalLine(1, WEBColors.white.withOpacity(0.66))),
      spacerHorizontal(16),
      Text(
        Strings.or,
        style: Types.buttonH4TStyle
            .copyWith(color: WEBColors.white.withOpacity(0.66)),
      ),
      spacerHorizontal(16),
      Expanded(child: horizontalLine(1, WEBColors.white.withOpacity(0.66))),
    ],
  );
}

Widget alreadyDontHaveAccount(bool login, Function() onClick,
    {bool fromWelcome = false,
    String firstText = '',
    String secondText = '',
    double textSize = 14}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
          secondText.isEmpty
              ? (fromWelcome
                  ? Strings.alreadyOnIThrive
                  : login
                      ? Strings.donTHaveAnAccount
                      : Strings.alreadyHaveAnAccount)
              : firstText,
          style: Types.buttonH4TStyle.copyWith(
              fontSize: textSize, color: WEBColors.white.withOpacity(0.66))),
      spacerHorizontal(8),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => onClick(),
          child: Text(
              secondText.isEmpty
                  ? (login ? Strings.signUp : Strings.signIn)
                  : secondText,
              style: Types.buttonH4TStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: textSize,
                  decoration: TextDecoration.underline)),
        ),
      )
    ],
  );
}
