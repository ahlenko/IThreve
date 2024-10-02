import 'package:flutter/widgets.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class RegularBoltRegularText extends StatelessWidget {
  final TextStyle? besicTextStyle;
  final String? firstText;
  final String? secondText;
  final String? thirdText;
  final String? anotherText;
  const RegularBoltRegularText(
      {super.key,
      this.besicTextStyle,
      this.firstText,
      this.secondText,
      this.thirdText,
      this.anotherText});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: besicTextStyle ?? Types.h2TitleRegularTStyle,
            children: _buildTextSpans()));
  }

  _buildTextSpans() {
    List<TextSpan> textSpans = [];

    if (firstText != null) {
      textSpans.add(TextSpan(
        text: firstText,
      ));
    }

    if (secondText != null) {
      textSpans.add(TextSpan(
          text: secondText,
          style: besicTextStyle == null
              ? Types.h2TitleRegularTStyle.copyWith(fontWeight: FontWeight.bold)
              : besicTextStyle!.copyWith(fontWeight: FontWeight.bold)));
    }

    if (thirdText != null) {
      textSpans.add(TextSpan(
        text: thirdText,
      ));
    }

    if (anotherText != null) {
      textSpans.add(TextSpan(
        text: anotherText,
      ));
    }

    return textSpans;
  }
}
