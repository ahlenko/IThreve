import 'package:flutter/material.dart';

import 'package:ithreve_web/app/constants/fonts.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class AutocompleteItem extends StatelessWidget {
  final String text;
  final String searchValue;
  final double fontSize;
  final Function() onTap;

  const AutocompleteItem({
    super.key,
    required this.text,
    required this.searchValue,
    this.fontSize = 20,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: buildHighlightedText(text, searchValue),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHighlightedText(String text, String searchValue) {
    final TextStyle normalStyle = Types.textFieldTStyle.copyWith(
        fontFamily: Fonts.sfProRegular,
        fontSize: fontSize,
        color: WEBColors.whiteGray);
    final TextStyle highlightStyle = Types.textFieldTStyle.copyWith(
        fontFamily: Fonts.sfProRegular,
        fontSize: fontSize,
        color: WEBColors.whiteGray.withOpacity(0.3));

    List<TextSpan> spans = [];
    String lowerCaseText = text.toLowerCase();
    String lowerCaseSearchValue = searchValue.toLowerCase();
    int startIndex = 0;

    while (startIndex < text.length) {
      final int indexOfSearchValue =
          lowerCaseText.indexOf(lowerCaseSearchValue, startIndex);
      if (indexOfSearchValue == -1) {
        spans.add(TextSpan(
          text: text.substring(startIndex),
          style: normalStyle,
        ));
        break;
      } else {
        // Add the text before the search value
        if (indexOfSearchValue > startIndex) {
          spans.add(TextSpan(
            text: text.substring(startIndex, indexOfSearchValue),
            style: normalStyle,
          ));
        }
        // Add the search value
        spans.add(TextSpan(
          text: text.substring(
              indexOfSearchValue, indexOfSearchValue + searchValue.length),
          style: highlightStyle,
        ));
        startIndex = indexOfSearchValue + searchValue.length;
      }
    }

    return RichText(text: TextSpan(children: spans));
  }
}
