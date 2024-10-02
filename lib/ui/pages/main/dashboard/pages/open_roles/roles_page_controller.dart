import 'dart:async';
import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/ui/components/web/headers/dashboard_header.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/main/roles_main_page.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/messages/roles_messages_page.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/roles_page_controller_cubit.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/roles_page_controller_state.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/roles_page_controller_types.dart';

class RolesPageController extends StatefulWidget {
  final String selectedPage;
  final String openDialogState;
  const RolesPageController(
      {super.key,
      this.selectedPage = RolesPageControllerTypes.mainPage,
      this.openDialogState = RolesPageControllerTypes.hideDialog});

  @override
  State<RolesPageController> createState() => _RolesPageControllerState();
}

class _RolesPageControllerState extends State<RolesPageController>
    with AfterLayoutMixin {
  RolesPageControllerCubit cubit = getIt.get<RolesPageControllerCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RolesPageControllerCubit, RolesPageControllerState>(
      bloc: cubit,
      builder: (context, state) {
        return ImageFiltered(
          imageFilter: ImageFilter.blur(
            sigmaX: state.openDialogState == RolesPageControllerTypes.hideDialog
                ? 0
                : 10,
            sigmaY: state.openDialogState == RolesPageControllerTypes.hideDialog
                ? 0
                : 10,
          ),
          child: Column(
            children: [
              DashboardHeader(
                onBackClick: () => cubit.onRedirect(
                    RolesPageControllerTypes.mainPage, context),
                headerTitle:
                    state.pageState == RolesPageControllerTypes.mainPage
                        ? Strings.openRoles.toUpperCase()
                        : Strings.backToJobs,
                withBackButton:
                    state.pageState == RolesPageControllerTypes.messagesPage,
              ),
              getActivePageComponent(state.pageState, cubit)
            ],
          ),
        );
      },
    );
  }

  getActivePageComponent(String pageState, RolesPageControllerCubit cubit) {
    switch (pageState) {
      case RolesPageControllerTypes.mainPage:
        return RolesMainPage(
          onNeedDialog: (dialogName) =>
              cubit.onDialogStateChange(dialogName, context),
          onNeedPage: (roleId) =>
              cubit.onRedirect(RolesPageControllerTypes.messagesPage, context),
        );
      case RolesPageControllerTypes.messagesPage:
        return RolesMessagesPage(
          onNeedDialog: (dialogName) =>
              cubit.onDialogStateChange(dialogName, context),
        );
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    cubit.onRedirect(widget.selectedPage, context);
    cubit.onDialogStateChange(widget.openDialogState, context);
    throw UnimplementedError();
  }
}
