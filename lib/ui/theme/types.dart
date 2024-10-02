import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/fonts.dart';
import 'package:ithreve_web/ui/theme/colors.dart';

class Types {
  static TextStyle headerLogoTStyle = _buildTextStyle(
      weight: FontWeight.bold, size: 32, color: WEBColors.white);
  static TextStyle headerItemTStyle =
      _buildTextStyle(size: 20, color: WEBColors.white);
  static TextStyle headerItem16TStyle = _buildTextStyle(
      size: 16, weight: FontWeight.bold, color: WEBColors.white);
  static TextStyle headerButtonTStyle =
      _buildTextStyle(size: 20, color: WEBColors.white);
  static TextStyle headerButton16TStyle = _buildTextStyle(
      size: 16, weight: FontWeight.bold, color: WEBColors.black);

  static TextStyle headerBoldButtonTStyle = _buildTextStyle(
      size: 20, color: WEBColors.white, weight: FontWeight.bold);

  static TextStyle textFieldTStyle =
      _buildTextStyle(size: 20, color: WEBColors.whiteGray.withOpacity(0.3));

  static TextStyle textFieldTitleTStyle =
      _buildTextStyle(size: 20, color: WEBColors.white.withOpacity(0.66));

  static TextStyle h1LargeTitleTStyle = _buildTextStyle(
      weight: FontWeight.bold, size: 200, color: WEBColors.white);
  static TextStyle h2TitleTStyle =
      _buildTextStyle(size: 56, color: WEBColors.fontWhite);
  static TextStyle h2TitleRegularTStyle =
      _buildTextStyle(size: 40, color: WEBColors.white);
  static TextStyle h3TitleTStyle = _buildTextStyle(
      size: 28, color: WEBColors.white, weight: FontWeight.w500);

  static TextStyle grayH3TStyle = _buildTextStyle(size: 20);

  static TextStyle buttonH4TStyle = _buildTextStyle(
    color: WEBColors.white,
    size: 16,
  );

  static TextStyle buttonBoltH4TStyle = _buildTextStyle(
    color: WEBColors.white,
    weight: FontWeight.bold,
    size: 16,
  );

  static TextStyle textLinkTStyle = _buildTextStyle(
    color: WEBColors.cyan,
    size: 14,
  );

  static TextStyle whiteBottonTStyle = _buildTextStyle(
      weight: FontWeight.bold, size: 24, color: WEBColors.white);

  static var errorTStyle = _buildTextStyle(
    color: WEBColors.erroeRed,
    size: 16,
  );

  static TextStyle grayRegular24TStyle =
      _buildTextStyle(size: 22, color: WEBColors.white.withOpacity(0.66));

  static TextStyle whiteRegular24TStyle =
      _buildTextStyle(size: 22, color: WEBColors.white);

  static TextStyle liteGreenRegularSmallStyle =
      _buildTextStyle(size: 12, color: WEBColors.liteGreen);

  static TextStyle _buildTextStyle(
      {Color color = WEBColors.fontGray,
      double size = 16,
      FontWeight weight = FontWeight.w400,
      String fontFamily = Fonts.sfProRegular,
      TextDecoration? decoration,
      Color decorationColor = WEBColors.fontGray}) {
    return TextStyle(
        color: color,
        fontSize: size,
        fontFamily: fontFamily,
        fontWeight: weight,
        decoration: decoration,
        decorationColor: decorationColor);
  }
}
