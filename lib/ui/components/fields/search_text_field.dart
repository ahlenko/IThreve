import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final double fontSize;
  final FocusNode? focusNode;
  final bool withSpacer;

  const SearchTextField({
    super.key,
    this.fontSize = 16,
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
                  borderRadius: BorderRadius.circular(100),
                  color: WEBColors.black),
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                onChanged: (value) {},
                focusNode: focusNode,
                cursorColor: WEBColors.white,
                controller: controller,
                decoration: InputDecoration(
                    prefixIconConstraints:
                        const BoxConstraints(maxHeight: 32, maxWidth: 32),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(
                        Vector.search,
                      ),
                    ),
                    hintText: Strings.searchForAnythingOnThisWebsite,
                    border: InputBorder.none,
                    hintStyle: Types.textFieldTStyle.copyWith(
                        fontSize: fontSize,
                        color: WEBColors.fontWhite.withOpacity(0.6))),
                style: Types.textFieldTStyle
                    .copyWith(color: WEBColors.white, fontSize: fontSize),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
