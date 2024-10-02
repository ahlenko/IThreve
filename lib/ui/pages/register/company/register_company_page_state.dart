import 'package:ithreve_web/ui/pages/register/company/content/register_company_content_types.dart';

class RegisterCompanyPageState {
  final String pageState;
  final double stepPercentage;
  final bool enableAi;

  RegisterCompanyPageState(
      {this.pageState = RegisterCompanyTypes.companyName,
      this.stepPercentage = 0,
      this.enableAi = false});

  RegisterCompanyPageState copyWith(
      {String? pageState, bool? enableAi, double? stepPercentage}) {
    return RegisterCompanyPageState(
        pageState: pageState ?? this.pageState,
        stepPercentage: stepPercentage ?? this.stepPercentage,
        enableAi: enableAi ?? this.enableAi);
  }
}
