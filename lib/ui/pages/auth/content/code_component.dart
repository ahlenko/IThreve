import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/components/buttons/clickable_text_button.dart';
import 'package:ithreve_web/ui/components/buttons/rounded_background_button.dart';
import 'package:ithreve_web/ui/components/fields/pin_code_field.dart';
import 'package:ithreve_web/ui/pages/auth/content/auth_content_types.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class CodeComponent extends StatefulWidget {
  final Function(String redirectType) onRedirect;
  final Function() onConfirmCode;
  const CodeComponent(
      {super.key, required this.onRedirect, required this.onConfirmCode});

  @override
  State<CodeComponent> createState() => _CodeComponentState();
}

class _CodeComponentState extends State<CodeComponent> {
  bool codeEntered = false;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 475, minWidth: 350),
      child: Column(
        children: [
          Text(
            Strings.pleaseEnterThe6DigitCode,
            style: Types.headerLogoTStyle
                .copyWith(fontSize: 27, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          spacerVertical(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 29),
            child: PinCodeField(error: '', controller: TextEditingController()),
          ),
          spacerVertical(48),
          ClickableTextButton(
              onClick: () => widget.onRedirect(AuthTypes.phone),
              text: Strings.changeNumber,
              regularStyle:
                  Types.buttonBoltH4TStyle.copyWith(color: WEBColors.whiteGray),
              hoveredStyle: Types.buttonBoltH4TStyle.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: Types.buttonBoltH4TStyle.color)),
          spacerVertical(40),
          Container(
            width: double.infinity,
            height: 65,
            margin: const EdgeInsets.symmetric(horizontal: 60),
            child: RoundedBackgroundButton(
              onClick: () => widget.onConfirmCode(),
              backgroundColor: WEBColors.darkGreen,
              text: Strings.next,
            ),
          ),
          spacerVertical(24),
          ClickableTextButton(
              onClick: () => {},
              text: Strings.sendCodeAgain,
              regularStyle:
                  Types.buttonBoltH4TStyle.copyWith(color: WEBColors.cyan),
              hoveredStyle: Types.buttonBoltH4TStyle.copyWith(
                  decoration: TextDecoration.underline,
                  color: WEBColors.cyan,
                  decorationColor: WEBColors.cyan))
        ],
      ),
    );
  }
}
