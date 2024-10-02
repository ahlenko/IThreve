import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/register/company/content/register_company_content_types.dart';
import 'package:ithreve_web/ui/pages/register/company/dialog/confirm_ai_fill_dialog.dart';
import 'package:ithreve_web/ui/pages/register/company/register_company_page_state.dart';

@Injectable()
class RegisterCompanyPageCubit extends Cubit<RegisterCompanyPageState> {
  RegisterCompanyPageCubit() : super(RegisterCompanyPageState()) {
    _init();
  }

  final stepsCount = 8;
  late double step;

  _init() {
    step = 1 / stepsCount;
  }

  void showAiFillDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: ConfirmAiFillDialog(
                  clickConfirm: (isConfirm) =>
                      {emit(state.copyWith(enableAi: isConfirm))}),
            )).then((_) => {});
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
      case RegisterCompanyTypes.registerVacancy:
        return 1;
      case RegisterCompanyTypes.companyName:
        return step * 1;
      case RegisterCompanyTypes.companyInfo:
        return step * 2;
      case RegisterCompanyTypes.jobFile:
        return step * 3;
      case RegisterCompanyTypes.jobLink:
        return step * 4;
      case RegisterCompanyTypes.firstJob:
        return step * 5;
      case RegisterCompanyTypes.needHelpWith:
        return step * 6;
      case RegisterCompanyTypes.jobWouldLikeAdd:
        return step * 7;
      default:
        return 0;
    }
  }

  onRedirect(String redirectTo, VoidCallback showDialog,
      VoidCallback navigateToUpdatedPage,
      {bool fromInit = false}) {
    switch (redirectTo) {
      case RegisterCompanyTypes.registerVacancy:
        emit(state.copyWith(pageState: redirectTo));
        showDialog();
        break;
      case RegisterCompanyTypes.companyName:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterCompanyTypes.companyInfo:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterCompanyTypes.jobFile:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterCompanyTypes.jobLink:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterCompanyTypes.firstJob:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterCompanyTypes.needHelpWith:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case RegisterCompanyTypes.jobWouldLikeAdd:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
    }

    animateProgressValue();
  }
}
