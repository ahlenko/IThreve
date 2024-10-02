import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';

class RegularTextWithPoint extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function() removeClick;

  const RegularTextWithPoint({
    super.key,
    this.focusNode,
    required this.removeClick,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: WEBColors.white),
                margin: const EdgeInsets.symmetric(horizontal: 12),
              ),
              IntrinsicWidth(
                child: TextFormField(
                  onChanged: (value) {},
                  focusNode: focusNode,
                  cursorColor: WEBColors.cyan,
                  controller: controller,
                  decoration: InputDecoration(
                      constraints: const BoxConstraints(maxHeight: 25),
                      hintText: 'Type new responsibility here',
                      border: InputBorder.none,
                      hintStyle: Types.buttonH4TStyle
                          .copyWith(color: WEBColors.white.withOpacity(0.66))),
                  style: Types.buttonH4TStyle,
                ),
              ),
            ],
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap: () => removeClick(),
                child: SvgPicture.asset(Vector.cross)),
          )
        ],
      ),
    );
  }
}
