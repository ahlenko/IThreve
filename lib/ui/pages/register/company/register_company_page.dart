import 'dart:async';
import 'dart:ui';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/app/navigation/routes.dart';
import 'package:ithreve_web/ui/components/web/decorator/registration_flow_decorator.dart';
import 'package:ithreve_web/ui/pages/register/company/content/add_first_job_step.dart';
import 'package:ithreve_web/ui/pages/register/company/content/add_job_file_step.dart';
import 'package:ithreve_web/ui/pages/register/company/content/add_job_link_step.dart';
import 'package:ithreve_web/ui/pages/register/company/content/company_aspects_step.dart';
import 'package:ithreve_web/ui/pages/register/company/content/company_info_step.dart';
import 'package:ithreve_web/ui/pages/register/company/content/company_name_step.dart';
import 'package:ithreve_web/ui/pages/register/company/content/job_would_like_to_add_step.dart';
import 'package:ithreve_web/ui/pages/register/company/content/register_company_content_types.dart';
import 'package:ithreve_web/ui/pages/register/company/dialog/some_info_about_role_dialog.dart';
import 'package:ithreve_web/ui/pages/register/company/register_company_page_cubit.dart';
import 'package:ithreve_web/ui/pages/register/company/register_company_page_state.dart';
import 'package:ithreve_web/ui/theme/colors.dart';

class RegisterCompanyPage extends StatefulWidget {
  final String? startPage;
  const RegisterCompanyPage({super.key, this.startPage});

  @override
  State<RegisterCompanyPage> createState() => _RegisterCompanyPageState();
}

class _RegisterCompanyPageState extends State<RegisterCompanyPage>
    with AfterLayoutMixin {
  final RegisterCompanyPageCubit cubit = getIt.get<RegisterCompanyPageCubit>();

  @override
  void initState() {
    cubit.onRedirect(widget.startPage ?? RegisterCompanyTypes.companyName,
        _navigateToRegistration, _navigateToUpdatedPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCompanyPageCubit, RegisterCompanyPageState>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
              backgroundColor: WEBColors.darkGray,
              body: RegistrationFlowDecorator(
                  percentage: state.stepPercentage,
                  child: getActivePageComponent(state.pageState, cubit)));
        });
  }

  getActivePageComponent(String pageState, RegisterCompanyPageCubit cubit) {
    switch (pageState) {
      case RegisterCompanyTypes.companyName:
        return CompanyNameStep(
          withAi: cubit.state.enableAi,
          onNeedNextPage: () => cubit.onRedirect(
              RegisterCompanyTypes.companyInfo,
              showSomeAboutDialog,
              _navigateToUpdatedPage),
        );
      case RegisterCompanyTypes.companyInfo:
        return CompanyInfoStep(
          withAi: cubit.state.enableAi,
          onNeedNextPage: () => cubit.onRedirect(RegisterCompanyTypes.jobFile,
              showSomeAboutDialog, _navigateToUpdatedPage),
        );
      case RegisterCompanyTypes.jobFile:
        return AddJobFileStep(
          onNeedNextPage: () => cubit.onRedirect(RegisterCompanyTypes.jobLink,
              showSomeAboutDialog, _navigateToUpdatedPage),
        );
      case RegisterCompanyTypes.jobLink:
        return AddJobLinkStep(
          onNeedNextPage: () => cubit.onRedirect(RegisterCompanyTypes.firstJob,
              showSomeAboutDialog, _navigateToUpdatedPage),
        );
      case RegisterCompanyTypes.firstJob:
        return AddFirstJobStep(
          onNeedNextPage: () => cubit.onRedirect(
              RegisterCompanyTypes.needHelpWith,
              showSomeAboutDialog,
              _navigateToUpdatedPage),
        );
      case RegisterCompanyTypes.needHelpWith:
        return CompanyAspectsStep(
          onNeedPrewPage: () => cubit.onRedirect(RegisterCompanyTypes.firstJob,
              showSomeAboutDialog, _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(
              RegisterCompanyTypes.jobWouldLikeAdd,
              showSomeAboutDialog,
              _navigateToUpdatedPage),
        );
      case RegisterCompanyTypes.jobWouldLikeAdd:
      case RegisterCompanyTypes.registerVacancy:
        return JobWouldLikeToAddStep(
          onNeedNextPage: () => cubit.onRedirect(
              RegisterCompanyTypes.registerVacancy,
              showSomeAboutDialog,
              _navigateToUpdatedPage),
        );
    }
  }

  void showSomeAboutDialog() {
    showDialog(
        context: context,
        builder: (context) => BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: SomeInfoAboutRoleDialog(
                  clickConfirm: (isConfirm) => {_navigateToRegistration()}),
            )).then((_) => _navigateToRegistration());
  }

  void _navigateToUpdatedPage() {
    final state = cubit.state;
    context.go(context
        .namedLocation('${RoutesNames.registerCompany}/${state.pageState}'));
  }

  void _navigateToRegistration() {
    context.push(Routes.registerVacancy);
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    if (widget.startPage == RegisterCompanyTypes.companyName) {
      cubit.showAiFillDialog(context);
    }
  }
}
