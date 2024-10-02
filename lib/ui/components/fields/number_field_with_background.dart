import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class NumberFieldWithBackground extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final String? hintText;
  final double fontSize;
  final FocusNode? focusNode;
  final bool withSpacer;

  const NumberFieldWithBackground({
    super.key,
    this.errorText,
    this.hintText,
    this.fontSize = 20,
    this.focusNode,
    this.withSpacer = true,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                  color: WEBColors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10)),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                onChanged: (value) {},
                focusNode: focusNode,
                cursorColor: WEBColors.cyan,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: controller,
                decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    hintStyle: Types.textFieldTStyle.copyWith(
                        fontSize: fontSize,
                        color: WEBColors.white.withOpacity(0.66))),
                style: Types.textFieldTStyle
                    .copyWith(color: WEBColors.white, fontSize: fontSize),
              ),
            ),
          ],
        ),
        spacerVertical(4),
        Row(
          children: [
            if (errorText != null)
              const Icon(
                Icons.info_outline_rounded,
                color: WEBColors.erroeRed,
                size: 18,
              ),
            spacerHorizontal(4),
            if (withSpacer || errorText != null)
              Text(errorText ?? '', style: Types.errorTStyle),
          ],
        )
      ],
    );
  }
}
