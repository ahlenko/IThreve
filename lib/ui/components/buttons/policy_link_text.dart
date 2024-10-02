import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class PolicyLinkText extends StatefulWidget {
  const PolicyLinkText({super.key});

  @override
  State<PolicyLinkText> createState() => _PolicyLinkTextState();
}

class _PolicyLinkTextState extends State<PolicyLinkText> {
  bool link1Covered = false, link2Covered = false, link3Covered = false;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Types.textLinkTStyle
            .copyWith(color: WEBColors.white.withOpacity(0.66)),
        children: _buildTextSpans(),
      ),
    );
  }

  List<TextSpan> _buildTextSpans() {
    List<TextSpan> textSpans = [];

    final regex = RegExp(r'\?(\w+)');
    final matches = regex.allMatches(Strings.byClickingAgreeJoin);

    int lastMatchEnd = 0;

    for (final match in matches) {
      if (match.start > lastMatchEnd) {
        textSpans.add(TextSpan(
            text: Strings.byClickingAgreeJoin
                .substring(lastMatchEnd, match.start)));
      }

      final marker = match.group(1);

      switch (marker) {
        case 'userAgreement':
          textSpans.add(
            TextSpan(
              text: Strings.userAgreement,
              style: link1Covered
                  ? Types.textLinkTStyle
                      .copyWith(decoration: TextDecoration.underline)
                  : Types.textLinkTStyle,
              recognizer: TapGestureRecognizer()..onTap = () {},
              mouseCursor: SystemMouseCursors.click,
              onEnter: (event) => setState(() => link1Covered = true),
              onExit: (event) => setState(() => link1Covered = false),
            ),
          );
          break;
        case 'privacyPolicy':
          textSpans.add(
            TextSpan(
              text: Strings.privacyPolicy,
              style: link2Covered
                  ? Types.textLinkTStyle
                      .copyWith(decoration: TextDecoration.underline)
                  : Types.textLinkTStyle,
              recognizer: TapGestureRecognizer()..onTap = () {},
              mouseCursor: SystemMouseCursors.click,
              onEnter: (event) => setState(() => link2Covered = true),
              onExit: (event) => setState(() => link2Covered = false),
            ),
          );
          break;

        case 'cookiePolicy':
          textSpans.add(
            TextSpan(
              text: Strings.cookiePolicy,
              style: link3Covered
                  ? Types.textLinkTStyle
                      .copyWith(decoration: TextDecoration.underline)
                  : Types.textLinkTStyle,
              recognizer: TapGestureRecognizer()..onTap = () {},
              mouseCursor: SystemMouseCursors.click,
              onEnter: (event) => setState(() => link3Covered = true),
              onExit: (event) => setState(() => link3Covered = false),
            ),
          );
          break;
      }

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < Strings.byClickingAgreeJoin.length) {
      textSpans.add(
          TextSpan(text: Strings.byClickingAgreeJoin.substring(lastMatchEnd)));
    }

    return textSpans;
  }
}
