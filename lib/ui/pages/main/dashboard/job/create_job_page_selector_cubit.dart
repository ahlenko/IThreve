import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/job/create_job_page_selector_state.dart';

@Injectable()
class CreateJobPageSelectorCubit extends Cubit<CreateJobPageSelectorState> {
  CreateJobPageSelectorCubit() : super(CreateJobPageSelectorState());
}
