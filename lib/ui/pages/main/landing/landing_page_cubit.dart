import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/main/landing/landing_page_state.dart';

@Injectable()
class LandingPageCubit extends Cubit<LandingPageState> {
  LandingPageCubit() : super(LandingPageState());


}
