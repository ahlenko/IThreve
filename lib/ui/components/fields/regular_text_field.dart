import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class RegularTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final String? hintText;
  final double fontSize;
  final FocusNode? focusNode;
  final bool withSpacer;

  const RegularTextField({
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
            TextFormField(
              onChanged: (value) {},
              focusNode: focusNode,
              cursorColor: WEBColors.cyan,
              controller: controller,
              decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                  hintStyle:
                      Types.textFieldTStyle.copyWith(fontSize: fontSize)),
              style: Types.textFieldTStyle
                  .copyWith(color: WEBColors.white, fontSize: fontSize),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: horizontalLine(1, WEBColors.white),
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
