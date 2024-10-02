import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/messages/roles_messages_page_state.dart';

@Injectable()
class RolesMessagesPageCubit extends Cubit<RolesMessagesPageState> {
  RolesMessagesPageCubit() : super(RolesMessagesPageState());

  changeDeleteState(bool newState) {
    emit(state.copyWith(stateDeleteHovered: newState));
  }

  changePauseState(bool newState) {
    emit(state.copyWith(statePauseHovered: newState));
  }
}
