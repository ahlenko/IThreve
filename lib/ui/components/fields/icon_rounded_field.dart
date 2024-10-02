import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class IconRoundedField extends StatelessWidget {
  final String icon;
  final String title;
  final String? value;
  final TextEditingController? controller;
  const IconRoundedField(
      {super.key,
      required this.icon,
      required this.title,
      this.controller,
      this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: Types.buttonH4TStyle
              .copyWith(color: WEBColors.white.withOpacity(0.66)),
        ),
        spacerVertical(4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 16,
              height: 16,
            ),
            spacerHorizontal(4),
            if (controller == null)
              Text(
                value ?? '',
                style: Types.buttonH4TStyle,
              )
            else
              IntrinsicWidth(
                  child: TextFormField(
                onChanged: (value) {},
                cursorColor: WEBColors.cyan,
                controller: controller,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                    hintText: Strings.typeHere,
                    border: InputBorder.none,
                    constraints: const BoxConstraints(maxHeight: 40),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: WEBColors.fieldGray.withOpacity(0.3),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: WEBColors.cyan,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    hintStyle: Types.textFieldTStyle.copyWith(fontSize: 16)),
                style: Types.textFieldTStyle
                    .copyWith(color: WEBColors.white, fontSize: 16),
              ))
          ],
        )
      ],
    );
  }
}
