import 'package:flutter/material.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class LandingPageDecorator extends StatelessWidget {
  final Widget child;
  const LandingPageDecorator({super.key, required this.child});

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
        Positioned.fill(
            child: Container(
          color: WEBColors.black.withOpacity(0.15),
        )),
        Positioned(
          top: screenHeight(context) * 0.18,
          left: -80,
          child: SizedBox(
            height: 320,
            width: 320,
            child: Image.asset(
              Raster.decoTriangle,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          top: 30,
          right: screenWidth(context) * 0.097,
          child: SizedBox(
            height: 118,
            width: 118,
            child: Image.asset(
              Raster.decoCube,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          top: screenHeight(context) * 0.27,
          right: -30,
          child: SizedBox(
            height: 155,
            width: 155,
            child: Image.asset(
              Raster.decoCube,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: -10,
          right: screenWidth(context) * 0.06,
          child: SizedBox(
            height: 360,
            width: 360,
            child: Image.asset(
              Raster.decoRound,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        child
      ],
    );
  }
}
