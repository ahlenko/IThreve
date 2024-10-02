import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/app/navigation/routes.dart';
import 'package:ithreve_web/ui/components/web/decorator/registration_flow_decorator.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/addition_candidate_skills_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/candidate_responsibility_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/candidate_team_joined_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/complete_create_vacancy_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/core_candidate_skills_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/effect_on_the_business_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/filled_position_date_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/ideal_candidate_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/important_skills_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/other_information_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/register_vacancy_content_types.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/role_essential_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/role_info_step.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/register_vacancy_page_cubit.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/register_vacancy_page_state.dart';

class RegisterVacancyPage extends StatefulWidget {
  final String? startPage;
  const RegisterVacancyPage({super.key, this.startPage});

  @override
  State<RegisterVacancyPage> createState() => _RegisterVacancyPageState();
}

class _RegisterVacancyPageState extends State<RegisterVacancyPage> {
  final RegisterVacancyPageCubit cubit = getIt.get<RegisterVacancyPageCubit>();

  @override
  void initState() {
    cubit.onRedirect(widget.startPage ?? RegisterVacancyTypes.teamJoined,
        _navigateToDeshboard, _navigateToUpdatedPage,
        fromInit: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterVacancyPageCubit, RegisterVacancyPageState>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
              body: RegistrationFlowDecorator(
                  rolesToRegister: cubit.registerRoles,
                  percentage: state.stepPercentage,
                  activeRole: state.registerVacancyIndex,
                  child: getActivePageComponent(state.pageState, cubit)));
        });
  }

  getActivePageComponent(String pageState, RegisterVacancyPageCubit cubit) {
    switch (pageState) {
      case RegisterVacancyTypes.businessEffect:
        return EffectOnTheBusinessStep(
          onNeedPrewPage: () => {},
          onNeedNextPage: () => cubit.onRedirect(
              RegisterVacancyTypes.idealCandidate,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
        );
      case RegisterVacancyTypes.idealCandidate:
        return IdealCandidateStep(
          candidateRole: cubit.registerRoles[cubit.state.registerVacancyIndex],
          onNeedPrewPage: () => cubit.onRedirect(
              RegisterVacancyTypes.businessEffect,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(
              RegisterVacancyTypes.responsibiliti,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
        );
      case RegisterVacancyTypes.responsibiliti:
        return CandidateResponsibilityStep(
          onNeedPrewPage: () => cubit.onRedirect(
              RegisterVacancyTypes.idealCandidate,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(
              RegisterVacancyTypes.roleEssential,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
        );
      case RegisterVacancyTypes.roleEssential:
        return RoleEssentialStep(
          onNeedPrewPage: () => cubit.onRedirect(
              RegisterVacancyTypes.idealCandidate,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(RegisterVacancyTypes.roleInfo,
              _navigateToDeshboard, _navigateToUpdatedPage),
        );
      case RegisterVacancyTypes.roleInfo:
        return RoleInfoStep(
          withAi: false,
          onNeedPrewPage: () => cubit.onRedirect(
              RegisterVacancyTypes.roleEssential,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(
              RegisterVacancyTypes.coreSkills,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
        );
      case RegisterVacancyTypes.coreSkills:
        return CoreCandidateSkillsStep(
          onNeedPrewPage: () => cubit.onRedirect(RegisterVacancyTypes.roleInfo,
              _navigateToDeshboard, _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(
              RegisterVacancyTypes.additionSkills,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
        );
      case RegisterVacancyTypes.additionSkills:
        return AdditionCandidateSkillsStep(
          onNeedPrewPage: () => cubit.onRedirect(
              RegisterVacancyTypes.coreSkills,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(
              RegisterVacancyTypes.importantSkills,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
        );
      case RegisterVacancyTypes.importantSkills:
        return ImportantSkillsStep(
          onNeedPrewPage: () => cubit.onRedirect(
              RegisterVacancyTypes.additionSkills,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(
              RegisterVacancyTypes.filledPositionData,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
        );
      case RegisterVacancyTypes.filledPositionData:
        return FilledPositionDateStep(
          onNeedPrewPage: () => cubit.onRedirect(
              RegisterVacancyTypes.importantSkills,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(
              RegisterVacancyTypes.teamJoined,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
        );

      case RegisterVacancyTypes.teamJoined:
        return CandidateTeamJoinedStep(
          onNeedPrewPage: () => cubit.onRedirect(
              RegisterVacancyTypes.filledPositionData,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(RegisterVacancyTypes.otherInfo,
              _navigateToDeshboard, _navigateToUpdatedPage),
        );
      case RegisterVacancyTypes.otherInfo:
        return OtherInformationStep(
          onNeedPrewPage: () => cubit.onRedirect(
              RegisterVacancyTypes.teamJoined,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(
              RegisterVacancyTypes.campleteStep,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
        );
      case RegisterVacancyTypes.campleteStep:
        return CompleteCreateVacancyStep(
          currentRole: cubit.registerRoles[cubit.state.registerVacancyIndex],
          nextRole:
              cubit.registerRoles.length <= cubit.state.registerVacancyIndex + 1
                  ? null
                  : cubit.registerRoles[cubit.state.registerVacancyIndex + 1],
          addAnotherVacancyInfo: () => cubit.onRedirect(
              RegisterVacancyTypes.nextRole,
              _navigateToDeshboard,
              _navigateToUpdatedPage),
          onNeedNextPage: () => cubit.onRedirect(RegisterVacancyTypes.deshboard,
              _navigateToDeshboard, _navigateToUpdatedPage),
        );
    }
  }

  void _navigateToUpdatedPage() {
    final state = cubit.state;
    context.go(context
        .namedLocation('${RoutesNames.registerVacancy}/${state.pageState}'));
  }

  void _navigateToDeshboard() {
    context.go(Routes.dashboard);
  }
}
