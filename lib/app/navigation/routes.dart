import 'package:ithreve_web/ui/pages/auth/content/auth_content_types.dart';
import 'package:ithreve_web/ui/pages/auth/login/login_page.dart';
import 'package:ithreve_web/ui/pages/auth/signup/sign_up_page.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/dashboard_page.dart';
import 'package:ithreve_web/ui/pages/main/landing/landing_page.dart';
import 'package:ithreve_web/ui/pages/register/company/content/register_company_content_types.dart';
import 'package:ithreve_web/ui/pages/register/company/register_company_page.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/content/register_vacancy_content_types.dart';
import 'package:ithreve_web/ui/pages/register/vacancy/register_vacancy_page.dart';
import 'package:go_router/go_router.dart';

class RoutesNames {
  static const landing = 'landing';
  static const dashboard = 'dashboard';
  static const logIn = 'login';
  static const signUp = 'signup';
  static const registerCompany = 'register-company';
  static const registerVacancy = 'register-vacancy';
}

class Routes {
  static const landing = '/landing';
  static const dashboard = '/dashboard';
  static const logIn = '/login';
  static const signUp = '/signup';
  static const registerCompany = '/register-company';
  static const registerVacancy = '/register-vacancy';
}

const pageId = 'startPage';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: Routes.landing,
  routes: [
    GoRoute(
      name: RoutesNames.landing,
      path: Routes.landing,
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
        name: RoutesNames.logIn,
        path: Routes.logIn,
        builder: (context, state) {
          return const LoginPage();
        },
        routes: [
          GoRoute(
            name: '${RoutesNames.logIn}_${AuthTypes.linkedid}',
            path: AuthTypes.linkedid,
            builder: (context, linkedid) {
              return const LoginPage(startPage: AuthTypes.linkedid);
            },
          ),
          GoRoute(
            name: '${RoutesNames.logIn}_${AuthTypes.phone}',
            path: AuthTypes.phone,
            builder: (context, state) {
              return const LoginPage(startPage: AuthTypes.phone);
            },
          ),
          GoRoute(
            name: '${RoutesNames.logIn}_${AuthTypes.email}',
            path: AuthTypes.email,
            builder: (context, state) {
              return const LoginPage(startPage: AuthTypes.email);
            },
          ),
          GoRoute(
            name: '${RoutesNames.logIn}_${AuthTypes.code}',
            path: AuthTypes.code,
            builder: (context, state) {
              return const LoginPage(startPage: AuthTypes.code);
            },
          )
        ]),
    GoRoute(
        name: RoutesNames.signUp,
        path: Routes.signUp,
        builder: (context, state) {
          return const SignUpPage();
        },
        routes: [
          GoRoute(
            name: '${RoutesNames.signUp}_${AuthTypes.welcome}',
            path: AuthTypes.welcome,
            builder: (context, state) {
              return const SignUpPage(startPage: AuthTypes.welcome);
            },
          ),
          GoRoute(
            name: '${RoutesNames.signUp}_${AuthTypes.linkedid}',
            path: AuthTypes.linkedid,
            builder: (context, state) {
              return const SignUpPage(startPage: AuthTypes.linkedid);
            },
          ),
          GoRoute(
            name: '${RoutesNames.signUp}_${AuthTypes.phone}',
            path: AuthTypes.phone,
            builder: (context, state) {
              return const SignUpPage(startPage: AuthTypes.phone);
            },
          ),
          GoRoute(
            name: '${RoutesNames.signUp}_${AuthTypes.email}',
            path: AuthTypes.email,
            builder: (context, state) {
              return const SignUpPage(startPage: AuthTypes.email);
            },
          ),
          GoRoute(
            name: '${RoutesNames.signUp}_${AuthTypes.code}',
            path: AuthTypes.code,
            builder: (context, state) {
              return const SignUpPage(startPage: AuthTypes.code);
            },
          )
        ]),
    GoRoute(
        name: RoutesNames.registerCompany,
        path: Routes.registerCompany,
        builder: (context, state) {
          return const RegisterCompanyPage();
        },
        routes: [
          GoRoute(
            name:
                '${RoutesNames.registerCompany}_${RegisterCompanyTypes.companyName}',
            path: RegisterCompanyTypes.companyName,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterCompanyTypes.companyName);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerCompany}_${RegisterCompanyTypes.companyInfo}',
            path: RegisterCompanyTypes.companyInfo,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterCompanyTypes.companyInfo);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerCompany}_${RegisterCompanyTypes.firstJob}',
            path: RegisterCompanyTypes.firstJob,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterCompanyTypes.firstJob);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerCompany}_${RegisterCompanyTypes.jobLink}',
            path: RegisterCompanyTypes.jobLink,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterCompanyTypes.jobLink);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerCompany}/${RegisterCompanyTypes.jobFile}',
            path: RegisterCompanyTypes.jobFile,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterCompanyTypes.jobFile);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerCompany}_${RegisterCompanyTypes.jobWouldLikeAdd}',
            path: RegisterCompanyTypes.jobWouldLikeAdd,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterCompanyTypes.jobWouldLikeAdd);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerCompany}_${RegisterCompanyTypes.needHelpWith}',
            path: RegisterCompanyTypes.needHelpWith,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterCompanyTypes.needHelpWith);
            },
          ),
        ]),
    GoRoute(
        name: RoutesNames.registerVacancy,
        path: Routes.registerVacancy,
        builder: (context, state) {
          return const RegisterVacancyPage();
        },
        routes: [
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.roleInfo}',
            path: RegisterVacancyTypes.roleInfo,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.roleInfo);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.roleEssential}',
            path: RegisterVacancyTypes.roleEssential,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.roleEssential);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.otherInfo}',
            path: RegisterVacancyTypes.otherInfo,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.otherInfo);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.importantSkills}',
            path: RegisterVacancyTypes.importantSkills,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.importantSkills);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}/${RegisterVacancyTypes.idealCandidate}',
            path: RegisterVacancyTypes.idealCandidate,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.idealCandidate);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.filledPositionData}',
            path: RegisterVacancyTypes.filledPositionData,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.filledPositionData);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.businessEffect}',
            path: RegisterVacancyTypes.businessEffect,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.businessEffect);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.coreSkills}',
            path: RegisterVacancyTypes.coreSkills,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.coreSkills);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.campleteStep}',
            path: RegisterVacancyTypes.campleteStep,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.campleteStep);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.teamJoined}',
            path: RegisterVacancyTypes.teamJoined,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.teamJoined);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.responsibiliti}',
            path: RegisterVacancyTypes.responsibiliti,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.responsibiliti);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.additionSkills}',
            path: RegisterVacancyTypes.additionSkills,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.additionSkills);
            },
          ),
          GoRoute(
            name:
                '${RoutesNames.registerVacancy}_${RegisterVacancyTypes.nextRole}',
            path: RegisterVacancyTypes.nextRole,
            builder: (context, state) {
              return const RegisterCompanyPage(
                  startPage: RegisterVacancyTypes.nextRole);
            },
          ),
        ]),
    GoRoute(
      name: RoutesNames.dashboard,
      path: Routes.dashboard,
      builder: (context, state) => const DashboardPage(),
    ),
  ],
);
