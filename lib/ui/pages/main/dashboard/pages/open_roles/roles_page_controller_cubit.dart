import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/calendar_data_enter_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/delete_interview_stage.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/edit/roles_edit_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/review/roles_review_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/this_role_closed_dialog.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/roles_page_controller_state.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/roles_page_controller_types.dart';

@Injectable()
class RolesPageControllerCubit extends Cubit<RolesPageControllerState> {
  RolesPageControllerCubit() : super(RolesPageControllerState());

  showRoleDeletedDialog(BuildContext context) {
    emit(state.copyWith(openDialogState: RolesPageControllerTypes.roleDeleted));
    showDialog(
      context: context,
      builder: (context) => const ThisRoleClosedDialog(),
    ).then((_) => {
          emit(state.copyWith(
              openDialogState: RolesPageControllerTypes.hideDialog))
        });
  }

  showCalendarDialog(BuildContext context) {
    emit(state.copyWith(
        openDialogState: RolesPageControllerTypes.calendarDialog));
    showDialog(
      context: context,
      builder: (context) => const CalendarDataEnterDialog(),
    ).then((_) => {
          emit(state.copyWith(
              openDialogState: RolesPageControllerTypes.hideDialog))
        });
  }

  showDeleteStageDialog(BuildContext context) {
    emit(state.copyWith(openDialogState: RolesPageControllerTypes.deleteStage));
    showDialog(
      context: context,
      builder: (context) => const DeleteInterviewStage(),
    ).then((_) => {
          emit(state.copyWith(
              openDialogState: RolesPageControllerTypes.hideDialog))
        });
  }

  showEditRoleDialog(BuildContext context, {bool inMaxSize = false}) async {
    var afterChangeDialog = false;
    emit(state.copyWith(openDialogState: RolesPageControllerTypes.editDialog));
    showDialog(
      context: context,
      builder: (context) => RolesEditDialog(
          isMaxSize: inMaxSize,
          onNeedReviewDialog: (value) => {
                afterChangeDialog = true,
                showReviewRoleDialog(context, inMaxSize: value)
              }),
    ).then((_) => {
          if (!afterChangeDialog)
            emit(state.copyWith(
                openDialogState: RolesPageControllerTypes.hideDialog))
        });
  }

  showReviewRoleDialog(BuildContext context, {bool inMaxSize = false}) async {
    var afterChangeDialog = false;
    emit(
        state.copyWith(openDialogState: RolesPageControllerTypes.reviewDialog));
    showDialog(
      context: context,
      builder: (context) => RolesReviewDialog(
          isMaxSize: inMaxSize,
          onNeedEditDialog: (value) => {
                afterChangeDialog = true,
                showEditRoleDialog(context, inMaxSize: value)
              }),
    ).then((_) => {
          if (!afterChangeDialog)
            emit(state.copyWith(
                openDialogState: RolesPageControllerTypes.hideDialog))
        });
  }

  onRedirect(String redirectTo, BuildContext context) {
    switch (redirectTo) {
      case RolesPageControllerTypes.mainPage:
        emit(state.copyWith(pageState: redirectTo));
        break;
      case RolesPageControllerTypes.messagesPage:
        emit(state.copyWith(pageState: redirectTo));
        break;
    }
  }

  onDialogStateChange(String dialogState, BuildContext context) {
    switch (dialogState) {
      case RolesPageControllerTypes.hideDialog:
        emit(state.copyWith(openDialogState: dialogState));
        break;
      case RolesPageControllerTypes.editDialog:
        showEditRoleDialog(context);
        break;
      case RolesPageControllerTypes.reviewDialog:
        showReviewRoleDialog(context);
        break;
      case RolesPageControllerTypes.calendarDialog:
        showCalendarDialog(context);
        break;
      case RolesPageControllerTypes.deleteStage:
        showDeleteStageDialog(context);
        break;
      case RolesPageControllerTypes.roleDeleted:
        showRoleDeletedDialog(context);
        break;
    }
  }
}
