import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/review/roles_review_dialog_state.dart';

@Injectable()
class RolesReviewDialogCubit extends Cubit<RolesReviewDialogState> {
  RolesReviewDialogCubit() : super(RolesReviewDialogState().initial());

  changeDialogSize() {
    emit(state.copyWith(maxDialogSize: !state.maxDialogSize));
  }

  changeDialogSizeBool(bool isMaxSize) {
    emit(state.copyWith(maxDialogSize: isMaxSize));
  }
}
