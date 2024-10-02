import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/dashboard_page_state.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/dashboard_page_types.dart';

@Injectable()
class DashboardPageCubit extends Cubit<DashboardPageState> {
  DashboardPageCubit() : super(DashboardPageState());

  void onRedirect(String redirectTo) {
    switch (redirectTo) {
      case DashboardPageTypes.openRoles:
        emit(state.copyWith(pageState: redirectTo));
      case DashboardPageTypes.swipePage:
        emit(state.copyWith(pageState: redirectTo));
      case DashboardPageTypes.messagesPage:
        emit(state.copyWith(pageState: redirectTo));
      case DashboardPageTypes.marketData:
        emit(state.copyWith(pageState: redirectTo));
      case DashboardPageTypes.profile:
        emit(state.copyWith(pageState: redirectTo));
      case DashboardPageTypes.addNewJob:
        emit(state.copyWith(pageState: redirectTo));
    }
  }
}
