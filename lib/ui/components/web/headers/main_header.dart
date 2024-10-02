import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/app/navigation/routes.dart';
import 'package:ithreve_web/ui/components/buttons/header_nav_button.dart';
import 'package:ithreve_web/ui/components/buttons/round_header_button.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class MainHeader extends StatelessWidget {
  final Function(String pageName) onNavigateCallbeck;
  MainHeader({super.key, required this.onNavigateCallbeck});

  final headerNavItems = [
    Strings.product,
    Strings.pricing,
    Strings.reviews,
    Strings.about,
  ];

  @override
  Widget build(BuildContext context) {
    var width = context.screenWidth;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width < UiConst.adaptiveWidth ? 25 : 40, vertical: 24),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                  onTap: () => onNavigateCallbeck(RoutesNames.landing),
                  child: SvgPicture.asset(
                    Vector.ithreveLogo,
                    width: 60,
                    height: 60,
                  )),
            ),
            spacerAdaptive(),
            Row(
              children: List.generate(
                  headerNavItems.length,
                  (index) => HeaderNavButton(
                        horizontalPadding:
                            width < UiConst.adaptiveWidth ? 24 : 28,
                        onClick: () {},
                        text: headerNavItems[index],
                      )),
            ),
            spacerAdaptive(),
            spacerAdaptive(),
            spacerAdaptive(),
            Offstage(
              offstage: width < UiConst.adaptiveWidth - 400,
              child: Row(children: [
                Offstage(
                  offstage: width < UiConst.adaptiveWidth - 200,
                  child: HeaderNavButton(
                    withDecoration: true,
                    onClick: () {},
                    text: Strings.imLookingForAJob,
                  ),
                ),
                spacerHorizontal(4),
                SizedBox(
                  height: 43,
                  child: RoundHeaderButton(
                      onClick: () => onNavigateCallbeck(RoutesNames.logIn),
                      text: Strings.logInSignUp,
                      backgroundColor: WEBColors.white.withOpacity(0.80)),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
