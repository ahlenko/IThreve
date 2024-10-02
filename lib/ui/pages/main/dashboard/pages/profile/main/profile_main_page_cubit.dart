import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/profile/main/profile_main_page_state.dart';

@Injectable()
class ProfileMainPageCubit extends Cubit<ProfileMainPageState> {
  ProfileMainPageCubit() : super(ProfileMainPageState());
}
