import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class IconMultilineTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? errorText;
  final String? title;
  final String icon;
  final String? hintText;
  final double fontSize;
  final String? initValue;
  final FocusNode? focusNode;
  final Function(String)? onEnter;

  const IconMultilineTextField({
    super.key,
    this.errorText,
    required this.icon,
    this.title,
    this.initValue,
    this.hintText,
    this.fontSize = 20,
    this.focusNode,
    this.onEnter,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!, style: Types.textFieldTitleTStyle),
        spacerVertical(8),
        TextFormField(
          onChanged: (value) {
            onEnter!(value);
          },
          maxLines: 10,
          minLines: 1,
          focusNode: focusNode,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\n')),
          ],
          cursorColor: WEBColors.cyan,
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 8, left: 8),
                child: SvgPicture.asset(icon),
              ),
              hintText: hintText,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: WEBColors.white.withOpacity(0.66),
                  width: 0.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: WEBColors.cyan,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              hintStyle: Types.textFieldTStyle.copyWith(fontSize: fontSize)),
          style: Types.textFieldTStyle
              .copyWith(color: WEBColors.white, fontSize: fontSize),
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
            Text(errorText ?? '', style: Types.errorTStyle),
          ],
        )
      ],
    );
  }
}
