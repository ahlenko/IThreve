import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/roles_page_controller_types.dart';

class RolesPageControllerState {
  final String pageState;
  final String openDialogState;

  RolesPageControllerState(
      {this.pageState = RolesPageControllerTypes.mainPage,
      this.openDialogState = RolesPageControllerTypes.hideDialog});

  RolesPageControllerState copyWith(
      {String? pageState, String? openDialogState}) {
    return RolesPageControllerState(
        pageState: pageState ?? this.pageState,
        openDialogState: openDialogState ?? this.openDialogState);
  }
}
