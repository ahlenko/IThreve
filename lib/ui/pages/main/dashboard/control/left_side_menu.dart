import 'package:flutter/material.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/constants/ui_const.dart';
import 'package:ithreve_web/domain/model/selected_dashboard_item.dart';
import 'package:ithreve_web/ui/components/buttons/add_job_button.dart';
import 'package:ithreve_web/ui/components/buttons/side_menu_item.dart';
import 'package:ithreve_web/ui/components/screen/screen_components.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/dashboard_page_types.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/raster.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/theme/types.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class LeftSideMenu extends StatefulWidget {
  final bool fromDrawer;
  final bool compactMode;
  final void Function(String pageType) onTap;

  const LeftSideMenu({
    required this.onTap,
    required this.compactMode,
    super.key,
    this.fromDrawer = false,
  });

  @override
  State<LeftSideMenu> createState() => _LeftSideMenuState();
}

class _LeftSideMenuState extends State<LeftSideMenu> {
  int _selectedPage = 0;

  List<SelectedDashboardItem> items = [
    SelectedDashboardItem(
      title: Strings.openRoles,
      icon: Vector.openRoles,
      iconChecked: Vector.openRolesChecked,
      messages: 30,
      pageType: DashboardPageTypes.openRoles,
    ),
    SelectedDashboardItem(
      title: Strings.swipe,
      icon: Vector.swipe,
      iconChecked: Vector.swipeChecked,
      pageType: DashboardPageTypes.swipePage,
    ),
    SelectedDashboardItem(
      title: Strings.messages,
      icon: Vector.messages,
      iconChecked: Vector.messagesChecked,
      pageType: DashboardPageTypes.messagesPage,
    ),
    SelectedDashboardItem(
      title: Strings.marketData,
      icon: Vector.marketData,
      iconChecked: Vector.marketDataChecked,
      pageType: DashboardPageTypes.marketData,
    ),
    SelectedDashboardItem(
      title: Strings.profile,
      icon: Vector.profile,
      iconChecked: Vector.profileChecked,
      pageType: DashboardPageTypes.profile,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var isExpanded = widget.fromDrawer ||
        (screenWidth(context) > UiConst.adaptiveWidth && !widget.compactMode);

    return SizedBox(
      width: isExpanded ? UiConst.drawerWidth : UiConst.drawerWidthCompact,
      child: Scaffold(
        backgroundColor: WEBColors.drawerColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 44, bottom: 44),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 6,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: isExpanded ? 16 : 0),
                        child: Row(
                          mainAxisAlignment: !isExpanded
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                          children: [
                            MouseRegion(
                              cursor: isExpanded
                                  ? MouseCursor.defer
                                  : SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () => {
                                  if (!isExpanded)
                                    Scaffold.of(context).openDrawer()
                                },
                                child: Image.asset(
                                  Raster.decoTriangle,
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                            ),
                            Offstage(
                              offstage: !isExpanded,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                  Strings.iThrive,
                                  style: Types.whiteRegular24TStyle
                                      .copyWith(fontSize: 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      spacerVertical(32),
                      ...List.generate(
                        items.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: SideMenuItem(
                            isSelected: _selectedPage == index,
                            onTap: () {
                              _selectedPage = index;
                              widget.onTap(items[index].pageType!);
                            },
                            item: items[index],
                            isExpanded: isExpanded,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                            width: double.infinity,
                            child: horizontalLine(
                                1, WEBColors.grayCyan.withOpacity(1))),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    spacerAdaptive(),
                    AddJobButton(
                      isExpanded: isExpanded,
                      onClick: () {},
                    ),
                    spacerAdaptive(),
                    SideMenuItem(
                      isSelected: false,
                      onTap: () {},
                      item: SelectedDashboardItem(
                        title: Strings.logOut,
                        icon: Vector.logout,
                      ),
                      isLogOut: true,
                      isExpanded: isExpanded,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
