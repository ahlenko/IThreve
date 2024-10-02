import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/messages_main_page_state.dart';

@Injectable()
class MessagesMainPageCubit extends Cubit<MessagesMainPageState> {
  MessagesMainPageCubit() : super(MessagesMainPageState());

  void emitDialogOpen(bool value) {
    emit(
      state.copyWith(
        isDialogOpen: value,
      ),
    );
  }
}
