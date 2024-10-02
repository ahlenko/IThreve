import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';

class MainFooter extends StatelessWidget {
  MainFooter({super.key});

  final logoItems = [
    Vector.uberLogo,
    Vector.zoomLogo,
    Vector.amazonLogo,
    Vector.spaceXLogo,
    Vector.figmaLogo,
    Vector.airbnbLogo
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: Container(
        color: WEBColors.black.withOpacity(0.1),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double itemWidth = 188;
            int maxItems = (constraints.maxWidth / itemWidth).floor();

            int visibleItemCount = maxItems.clamp(0, logoItems.length);

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                visibleItemCount,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SvgPicture.asset(
                    logoItems[index],
                    height: 48,
                    width: itemWidth,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
