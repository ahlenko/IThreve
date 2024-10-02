import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/components/web/decorator/gradient_border_container.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class AuthFlowDecorator extends StatelessWidget {
  final Widget child;
  final SvgPicture? topIcon;
  const AuthFlowDecorator({super.key, required this.child, this.topIcon});

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
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                spacerVertical(40),
                if (topIcon != null)
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: topIcon!),
                GradientBorderContainer(
                  child: Container(
                      decoration: BoxDecoration(
                        color: WEBColors.gray.withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(19)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 32),
                        child: Column(
                          children: [
                            SvgPicture.asset(Vector.ithreveLogo),
                            spacerVertical(40),
                            child
                          ],
                        ),
                      )),
                ),
                spacerVertical(40),
              ],
            ),
          ),
        )
      ],
    );
  }
}
