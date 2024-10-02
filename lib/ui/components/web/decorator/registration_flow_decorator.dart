import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class RegistrationFlowDecorator extends StatelessWidget {
  final Widget child;
  final List<String>? rolesToRegister;
  final int? activeRole;
  final double percentage;
  const RegistrationFlowDecorator(
      {super.key,
      required this.child,
      this.activeRole = 0,
      this.rolesToRegister,
      this.percentage = 0.10});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            Raster.mainBackground,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        Offstage(
          offstage: percentage == 0,
          child: Container(
            width: double.infinity,
            height: 8,
            color: WEBColors.cyan.withOpacity(0.2),
          ),
        ),
        Offstage(
          offstage: percentage == 0,
          child: Container(
            width: screenWidth(context) * percentage,
            height: 8,
            decoration: const BoxDecoration(
                color: WEBColors.cyan,
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(10))),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                spacerVertical(60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        Vector.ithreveLogo,
                        width: 70,
                        height: 70,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                rolesToRegister?.length ?? 0,
                                (index) => Row(
                                      children: [
                                        spacerHorizontal(48),
                                        Icon(
                                          Icons.circle_outlined,
                                          color: index != activeRole
                                              ? WEBColors.white
                                                  .withOpacity(0.66)
                                              : WEBColors.white,
                                          size: 20,
                                        ),
                                        spacerHorizontal(8),
                                        Text(
                                          rolesToRegister![index],
                                          style: Types.headerBoldButtonTStyle
                                              .copyWith(
                                                  color: index != activeRole
                                                      ? WEBColors.white
                                                          .withOpacity(0.66)
                                                      : null),
                                        ),
                                      ],
                                    )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                spacerVertical(40 + screenHeight(context) * 0.06),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    constraints: const BoxConstraints(minHeight: 460),
                    child: Center(child: child)),
                spacerVertical(40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
