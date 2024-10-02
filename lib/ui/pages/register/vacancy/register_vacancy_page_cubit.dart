import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/register_vacancy_content_types.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/register_vacancy_page_state.dart';

@Injectable()
class RegisterVacancyPageCubit extends Cubit<RegisterVacancyPageState> {
  RegisterVacancyPageCubit() : super(RegisterVacancyPageState()) {
    _init();
  }

  final stepsCount = 13;
  late double step;

  List<String> registerRoles = [
    'Product Designer',
    'Software Engineer',
    'Marketing Engineer'
  ];

  _init() {
    step = 1 / stepsCount;
  }

  Future<void> animateProgressValue() async {
    double firstVal = state.stepPercentage;
    double finalVal = getStatePercentage();
    int steps = 30;
    double stepSize = (finalVal - firstVal) / steps;
    int stepDuration = 16;

    for (int i = 0; i < steps; i++) {
      double newValue = firstVal + stepSize * (i + 1);
      emit(state.copyWith(stepPercentage: newValue));
      await Future.delayed(Duration(milliseconds: stepDuration));
    }

    emit(state.copyWith(stepPercentage: finalVal));
  }

  double getStatePercentage() {
    switch (state.pageState) {
      case RegisterVacancyTypes.deshboard:
        return 1;
      case RegisterVacancyTypes.businessEffect:
        return step * 1;
      case RegisterVacancyTypes.idealCandidate:
        return step * 2;
      case RegisterVacancyTypes.responsibiliti:
        return step * 3;
      case RegisterVacancyTypes.roleEssential:
        return step * 4;
      case RegisterVacancyTypes.roleInfo:
        return step * 5;
      case RegisterVacancyTypes.coreSkills:
        return step * 6;
      case RegisterVacancyTypes.additionSkills:
        return step * 7;
      case RegisterVacancyTypes.importantSkills:
        return step * 8;
      case RegisterVacancyTypes.filledPositionData:
        return step * 9;
      case RegisterVacancyTypes.teamJoined:
        return step * 10;
      case RegisterVacancyTypes.otherInfo:
        return step * 11;
      case RegisterVacancyTypes.campleteStep:
        return step * 12;
      case RegisterVacancyTypes.nextRole:
        return step;
      default:
        return 0;
    }
  }

  onRedirect(String redirectTo, VoidCallback navigateToDeshboard,
      VoidCallback navigateToUpdatedPage,
      {bool fromInit = false}) async {
    switch (redirectTo) {
      case RegisterVacancyTypes.deshboard:
        emit(state.copyWith(pageState: redirectTo));
        break;
      case RegisterVacancyTypes.businessEffect:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.idealCandidate:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.responsibiliti:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.roleEssential:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.roleInfo:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.coreSkills:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.additionSkills:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.importantSkills:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.filledPositionData:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.teamJoined:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.otherInfo:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.campleteStep:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterVacancyTypes.nextRole:
        emit(state.copyWith(
            pageState: RegisterVacancyTypes.businessEffect,
            registerVacancyIndex: state.registerVacancyIndex + 1));
        break;
    }

    if (state.pageState == RegisterVacancyTypes.deshboard) {
      await animateProgressValue();
      navigateToDeshboard();
    } else {
      animateProgressValue();
    }
  }
}
