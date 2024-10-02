import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/app/navigation/routes.dart';
import 'package:ithreve_web/ui/components/buttons/gradient_button.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/components/web/footers/main_footer.dart';
import 'package:ithreve_web/ui/components/web/headers/main_header.dart';
import 'package:ithreve_web/ui/pages/main/landing/landing_page_cubit.dart';
import 'package:ithreve_web/ui/components/web/decorator/langing_page_decorator.dart';
import 'package:ithreve_web/ui/pages/main/landing/landing_page_state.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final LandingPageCubit cubit = getIt.get<LandingPageCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LandingPageCubit, LandingPageState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: WEBColors.darkGray,
          body: LandingPageDecorator(
            child: Column(children: [
              MainHeader(
                onNavigateCallbeck: (pageName) =>
                    _navigateToPage(pageName, context),
              ),
              Expanded(
                  child: PageContent(
                onNavigateCallbeck: (pageName) =>
                    _navigateToPage(pageName, context),
              )),
              MainFooter()
            ]),
          ),
        );
      },
    );
  }

  void _navigateToPage(String pageName, BuildContext context) {
    context.go(context.namedLocation(pageName));
  }
}

class PageContent extends StatelessWidget {
  final Function(String pageName) onNavigateCallbeck;
  const PageContent({super.key, required this.onNavigateCallbeck});

  @override
  Widget build(BuildContext context) {
    var width = context.screenWidth;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            Strings.recruitmentMobileAndWebApp,
            style: Types.headerLogoTStyle
                .copyWith(fontSize: width <= 600 ? 28 : null),
          ),
          spacerVertical(context.screenHeight * 0.028),
          Text(
            Strings.iThrive,
            style: Types.h1LargeTitleTStyle
                .copyWith(fontSize: width <= 600 ? 150 : null),
          ),
          spacerVertical(context.screenHeight * 0.028),
          Text(
            Strings.trustedBy,
            style: Types.headerButtonTStyle,
          ),
          spacerVertical(8),
          SizedBox(
            width: 670,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Strings.userCount, style: Types.whiteBottonTStyle),
                        Text(Strings.user, style: Types.grayH3TStyle)
                      ],
                    ),
                  ),
                ),
                verticalLine(2, WEBColors.liteGray.withOpacity(0.1),
                    height: 80),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Strings.jobsCount, style: Types.whiteBottonTStyle),
                        Text(Strings.jobs, style: Types.grayH3TStyle)
                      ],
                    ),
                  ),
                ),
                verticalLine(2, WEBColors.liteGray.withOpacity(0.1),
                    height: 80),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(Strings.companiesCount,
                            style: Types.whiteBottonTStyle),
                        Text(Strings.companies, style: Types.grayH3TStyle)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          spacerVertical(40),
          GradientButton(
              height: 75,
              gradientSource: Raster.blueGradient,
              onClick: () => onNavigateCallbeck(RoutesNames.signUp),
              text: Strings.getStarted),
          spacerVertical(45)
        ]),
      ),
    );
  }
}
