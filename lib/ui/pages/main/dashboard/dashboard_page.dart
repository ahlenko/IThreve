import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/control/left_side_menu.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/dashboard_page_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/dashboard_page_state.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/dashboard_page_types.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/job/create_job_page_selector.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/main/market_data_main_page.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/messages_main_page.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/messages_main_page_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/roles_page_controller.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/profile/main/profile_main_page.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/main/swipes_main_page.dart';
import 'package:ithreve_web/ui/theme/colors.dart';

class DashboardPage extends StatefulWidget {
  final String selectedPage;
  const DashboardPage(
      {super.key, this.selectedPage = DashboardPageTypes.swipePage});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final cubit = getIt.get<DashboardPageCubit>();

  @override
  void initState() {
    cubit.onRedirect(widget.selectedPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardPageCubit, DashboardPageState>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
            drawer: LeftSideMenu(
              compactMode: state.pageState == DashboardPageTypes.swipePage,
              fromDrawer: true,
              onTap: (value) {
                cubit.onRedirect(
                  value,
                );
              },
            ),
            backgroundColor: WEBColors.dark,
            body: Row(
              children: [
                LeftSideMenu(
                  compactMode: state.pageState == DashboardPageTypes.swipePage,
                  onTap: (value) {
                    cubit.onRedirect(
                      value,
                    );
                  },
                ),
                Flexible(child: getActivePageComponent())
              ],
            ),
          );
        });
  }

  getActivePageComponent() {
    switch (cubit.state.pageState) {
      case DashboardPageTypes.openRoles:
        return const RolesPageController();
      case DashboardPageTypes.swipePage:
        return const SwipesMainPage();
      case DashboardPageTypes.messagesPage:
        return BlocProvider(
            create: (context) => getIt.get<MessagesMainPageCubit>(),
            child: const MessagesMainPage());
      case DashboardPageTypes.marketData:
        return const MarketDataMainPage();
      case DashboardPageTypes.profile:
        return const ProfileMainPage();
      case DashboardPageTypes.addNewJob:
        return const CreateJobPageSelector();
    }
  }
}
