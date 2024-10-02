import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/main/roles_main_page_state.dart';

@Injectable()
class RolesMainPageCubit extends Cubit<RolesMainPageState> {
  RolesMainPageCubit() : super(RolesMainPageState());
}
