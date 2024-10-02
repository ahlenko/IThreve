import 'package:ithreve_web/ui/pages/register/vacancy/content/register_vacancy_content_types.dart';

class RegisterVacancyPageState {
  final String pageState;
  final double stepPercentage;
  final int registerVacancyIndex;
  final bool enableAi;

  RegisterVacancyPageState(
      {this.pageState = RegisterVacancyTypes.businessEffect,
      this.stepPercentage = 0,
      this.registerVacancyIndex = 0,
      this.enableAi = false});

  RegisterVacancyPageState copyWith(
      {String? pageState,
      bool? enableAi,
      double? stepPercentage,
      int? registerVacancyIndex}) {
    return RegisterVacancyPageState(
        pageState: pageState ?? this.pageState,
        stepPercentage: stepPercentage ?? this.stepPercentage,
        registerVacancyIndex: registerVacancyIndex ?? this.registerVacancyIndex,
        enableAi: enableAi ?? this.enableAi);
  }
}
