import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/app/navigation/routes.dart';
import 'package:ithreve_web/ui/components/web/decorator/auth_flow_decorator.dart';
import 'package:ithreve_web/ui/pages/auth/content/auth_content_types.dart';
import 'package:ithreve_web/ui/pages/auth/content/code_component.dart';
import 'package:ithreve_web/ui/pages/auth/content/email_component.dart';
import 'package:ithreve_web/ui/pages/auth/content/linkedin_component.dart';
import 'package:ithreve_web/ui/pages/auth/content/phone_component.dart';
import 'package:ithreve_web/ui/pages/auth/content/welcome_component.dart';
import 'package:ithreve_web/ui/pages/auth/signup/sign_up_page_cubit.dart';
import 'package:ithreve_web/ui/pages/auth/signup/sign_up_page_state.dart';
import 'package:ithreve_web/ui/pages/register/company/content/register_company_content_types.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';

class SignUpPage extends StatefulWidget {
  final String startPage;
  const SignUpPage({super.key, this.startPage = AuthTypes.welcome});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpPageCubit cubit = getIt.get<SignUpPageCubit>();

  @override
  void initState() {
    cubit.onRedirect(widget.startPage, _navigateToLogin, _navigateToUpdatedPage,
        fromInit: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpPageCubit, SignUpPageState>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
              backgroundColor: WEBColors.darkGray,
              body: AuthFlowDecorator(
                  topIcon: state.pageState == AuthTypes.linkedid
                      ? SvgPicture.asset(Vector.linkedidLogo)
                      : null,
                  child: getActivePageComponent(state.pageState, cubit)));
        });
  }

  getActivePageComponent(String pageState, SignUpPageCubit cubit) {
    switch (pageState) {
      case AuthTypes.welcome:
        return WelcomeComponent(
          onRedirect: (redirectType) => cubit.onRedirect(
              redirectType, _navigateToLogin, _navigateToUpdatedPage),
        );
      case AuthTypes.phone:
        return PhoneComponent(
            isLogin: false,
            onConfirmPhone: () => cubit.onConfirmPhone(),
            onRedirect: (redirectType) => cubit.onRedirect(
                redirectType, _navigateToLogin, _navigateToUpdatedPage));
      case AuthTypes.email:
        return EmailComponent(
            isLogin: false,
            onConfirmEmail: _navigateToRegistration,
            onRedirect: (redirectType) => cubit.onRedirect(
                redirectType, _navigateToLogin, _navigateToUpdatedPage));
      case AuthTypes.linkedid:
        return LinkedinComponent(
            isLogin: false,
            onConfirmlinkedIn: _navigateToRegistration,
            onRedirect: (redirectType) => cubit.onRedirect(
                redirectType, _navigateToLogin, _navigateToUpdatedPage));
      case AuthTypes.code:
        return CodeComponent(
            onConfirmCode: _navigateToRegistration,
            onRedirect: (redirectType) => cubit.onRedirect(
                redirectType, _navigateToLogin, _navigateToUpdatedPage));
    }
  }

  void _navigateToUpdatedPage() {
    final state = cubit.state;
    context
        .go(context.namedLocation('${RoutesNames.signUp}/${state.pageState}'));
  }

  void _navigateToLogin() {
    final state = cubit.state;

    if (state.pageState == AuthTypes.phone ||
        state.pageState == AuthTypes.email) {
      context.push(
          context.namedLocation('${RoutesNames.logIn}/${state.pageState}'));
    } else {
      context.push(context.namedLocation(RoutesNames.logIn));
    }
  }

  void _navigateToRegistration() {
    context.go(context.namedLocation(
        '${RoutesNames.registerCompany}/${RegisterCompanyTypes.companyName}'));
  }
}
