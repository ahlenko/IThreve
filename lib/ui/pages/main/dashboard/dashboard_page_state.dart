import 'package:ithreve_web/ui/pages/main/dashboard/dashboard_page_types.dart';

class DashboardPageState {
  final String pageState;

  DashboardPageState({
    this.pageState = DashboardPageTypes.openRoles,
  });

  DashboardPageState copyWith({String? pageState}) {
    return DashboardPageState(
      pageState: pageState ?? this.pageState,
    );
  }
}
