import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/fonts.dart';
import 'package:ithreve_web/ui/theme/colors.dart';

ThemeData createTheme() {
  return ThemeData(
    appBarTheme: const AppBarTheme(color: WEBColors.drawerColor),
    useMaterial3: false,
    scaffoldBackgroundColor: WEBColors.darkGray,
    fontFamily: Fonts.sfProRegular,
    scrollbarTheme: ScrollbarThemeData(
        trackColor:
            WidgetStatePropertyAll(WEBColors.fontWhite.withOpacity(0.1)),
        thumbColor: const WidgetStatePropertyAll(WEBColors.darkGreen)),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
    checkboxTheme: CheckboxThemeData(
      side: WidgetStateBorderSide.resolveWith(
        (states) => BorderSide(
          color: WEBColors.white.withOpacity(0.66),
          width: 1.5,
        ),
      ),
      fillColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.grey;
        }
        if (states.contains(WidgetState.selected)) {
          return WEBColors.darkGreen;
        }
        return Colors.transparent;
      }),
      checkColor:
          WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return Colors.white.withOpacity(0.5);
        }
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return Colors.transparent;
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}
