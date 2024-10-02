import 'dart:async';
import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/app/extenshions.dart';
import 'package:ithreve_web/domain/model/selected_with_count.dart';
import 'package:ithreve_web/ui/components/buttons/page_segment_selector_button.dart';
import 'package:ithreve_web/ui/components/web/headers/swiping_header.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/main/roles_main_page.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/content/addition_skills_profile_page_item.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/content/core_skills_profile_page_item.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/content/history_profile_page_item.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/content/interests_profile_page_item.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/content/logistics_profile_page_item.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/content/overview_profile_page_item.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/content/profile_info_and_review_item.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/content/projects_profile_page_item.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/dialogs/auto_message_send_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/dialogs/filters_dialog/filters_owerlay_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/dialogs/lets_get_swiping_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/dialogs/would_you_like_to_auto_send.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/main/swipes_main_page_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/main/swipes_main_page_state.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';
import 'package:ithreve_web/ui/utils/screen_util.dart';

class SwipesMainPage extends StatefulWidget {
  const SwipesMainPage({super.key});

  @override
  State<SwipesMainPage> createState() => _SwipesMainPageState();
}

class _SwipesMainPageState extends State<SwipesMainPage> with AfterLayoutMixin {
  final SwipesMainPageCubit cubit = getIt.get<SwipesMainPageCubit>();

  List<SelectedWithCount> itemsSelector = [
    SelectedWithCount(title: Strings.all, selected: true, count: 3400),
    SelectedWithCount(title: Strings.top10Picks, count: 0),
    SelectedWithCount(title: Strings.bestSkills, count: 30),
    SelectedWithCount(title: Strings.bestLogistics, count: 20),
    SelectedWithCount(title: Strings.bestOverall, count: 23),
    SelectedWithCount(title: Strings.random, count: 30),
  ];

  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollPageController = ScrollController();
  bool likeHovered = false;
  bool dislikeHovered = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwipesMainPageCubit, SwipesMainPageState>(
      bloc: cubit,
      builder: (context, state) {
        return Stack(
          children: [
            Column(
              children: [
                SwipingHeader(
                    autoMessageSelected: true,
                    currentVacancy: 'Software Engineers',
                    onFiltersClick: () => showFiltersOwerlayDialog(context),
                    onAutoMessageStateChange: (value) => {},
                    onSelectVacancy: (value) => {},
                    vacancyList: const [
                      'Software Engineers',
                      'Product Designer'
                    ]),
                SizedBox(
                  height: 54,
                  child: Scrollbar(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: ListView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          spacerHorizontal(32),
                          for (SelectedWithCount item in itemsSelector)
                            ItemSelector(
                                item: item,
                                onChangeSelections: (selected) => setState(() {
                                      for (SelectedWithCount itemR
                                          in itemsSelector) {
                                        itemR.selected = false;
                                      }
                                      item.selected = selected;
                                    })),
                          spacerHorizontal(20),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 12, bottom: 32),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Flexible(
                          flex: 3, child: ProfileInfoAndReviewItem()),
                      spacerHorizontal(12),
                      Flexible(
                          flex: 8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 64,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10)),
                                    color: WEBColors.drawerColor),
                                child: Scrollbar(
                                  controller: _scrollPageController,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      controller: _scrollPageController,
                                      child: Row(
                                        children: [
                                          for (var i = 0;
                                              i < cubit.pageSelector.length;
                                              i++)
                                            PageSegmentSelectroButton(
                                              onSelectPage: () {
                                                cubit.setSelectedPage(i);
                                              },
                                              pageCount:
                                                  cubit.pageSelector.length,
                                              pageData: cubit.pageSelector[i],
                                              pageNumber: i,
                                            )
                                        ],
                                      )),
                                ),
                              ),
                              Container(
                                  width: double.maxFinite,
                                  height: context.screenHeight - 250,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(10)),
                                      color: WEBColors.nightDarknes),
                                  child: getActivePageComponent())
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 21),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() {
                        dislikeHovered = true;
                      }),
                      onExit: (_) => setState(() {
                        dislikeHovered = false;
                      }),
                      child: GestureDetector(
                        onTap: () {},
                        child: ClipOval(
                          child: Container(
                            height: 94,
                            width: 94,
                            color: dislikeHovered
                                ? WEBColors.fontWhite
                                : WEBColors.white,
                            child: SvgPicture.asset(
                              Vector.dislikeButton,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ),
                    spacerHorizontal(52),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() {
                        likeHovered = true;
                      }),
                      onExit: (_) => setState(() {
                        likeHovered = false;
                      }),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 94,
                          width: 94,
                          decoration: BoxDecoration(
                            color: likeHovered
                                ? WEBColors.darkGreen.withOpacity(0.8)
                                : WEBColors.darkGreen,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 1.5,
                                color: WEBColors.white.withOpacity(0.3)),
                            boxShadow: const [
                              BoxShadow(
                                color: WEBColors.cyan,
                                blurRadius: 40,
                                spreadRadius: 0,
                                offset: Offset(4, 0),
                              ),
                            ],
                          ),
                          child: SvgPicture.asset(
                            Vector.likeButton,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  getActivePageComponent() {
    switch (cubit.state.selectedPageIndex) {
      case 0:
        return const OverviewProfilePageItem();
      case 1:
        return ProjectsProfilePageItem(
          onExpandedChange: cubit.onChangeProgectExpanded,
          expandedViewEnable: cubit.state.projectExpanded,
        );
      case 2:
        return const CoreSkillsProfilePageItem();
      case 3:
        return const AdditionSkillsProfilePageItem();
      case 4:
        return const InterestsProfilePageItem();
      case 5:
        return const LogisticsProfilePageItem();
      case 6:
        return const HistoryProfilePageItem();
    }
  }

  void showFiltersOwerlayDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: const FiltersOwerlayDialog(),
            ));
  }

  void showWouldYouLikeToAutoSend(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: WouldYouLikeToAutoSend(
                clickConfirm: (p0, p1) => {},
              ),
            ));
  }

  void showAutoMessageSendDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: const AutoMessageSendDialog(),
            ));
  }

  void showLetsGetSwipingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: const LetsGetSwipingDialog(),
            ));
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    cubit.setSelectedPage(1);
    //showLetsGetSwipingDialog(context);
  }
}
