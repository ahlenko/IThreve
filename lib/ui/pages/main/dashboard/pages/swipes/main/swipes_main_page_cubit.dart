import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/app/constants/strings.dart';
import 'package:ithreve_web/domain/model/selected_with_count.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/main/swipes_main_page_state.dart';

@Injectable()
class SwipesMainPageCubit extends Cubit<SwipesMainPageState> {
  SwipesMainPageCubit() : super(SwipesMainPageState());

  List<SelectedWithCount> pageSelector = [
    SelectedWithCount(title: Strings.overview),
    SelectedWithCount(title: Strings.projects, count: 90, selected: true),
    SelectedWithCount(title: Strings.ucoreSkills, count: 90),
    SelectedWithCount(title: Strings.uAdditionalSkills, count: 90),
    SelectedWithCount(title: Strings.interests, count: 90),
    SelectedWithCount(title: Strings.logistics, count: 90),
    SelectedWithCount(title: Strings.history),
  ];

  void setSelectedPage(int index) {
    for (var i = 0; i < pageSelector.length; i++) {
      pageSelector[i].selected = false;
      if (i == index) pageSelector[i].selected = true;
    }
    emit(state.copyWith(selectedPageIndex: index));
  }

  onChangeProgectExpanded() {
    emit(state.copyWith(projectExpanded: !state.projectExpanded));
  }
}
