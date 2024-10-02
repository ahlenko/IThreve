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
import 'package:ithreve_web/ui/pages/auth/login/login_page_cubit.dart';
import 'package:ithreve_web/ui/pages/auth/login/login_page_state.dart';
import 'package:ithreve_web/ui/theme/colors.dart';
import 'package:ithreve_web/ui/theme/images/vector.dart';

class LoginPage extends StatefulWidget {
  final String startPage;
  const LoginPage({super.key, this.startPage = AuthTypes.phone});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginPageCubit cubit = getIt.get<LoginPageCubit>();

  @override
  void initState() {
    cubit.onRedirect(widget.startPage, _navigateToLogin, _navigateToUpdatedPage,
        fromInit: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginPageCubit, LoginPageState>(
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

  getActivePageComponent(String pageState, LoginPageCubit cubit) {
    switch (pageState) {
      case AuthTypes.phone:
        return PhoneComponent(
            isLogin: true,
            onConfirmPhone: () => cubit.onConfirmPhone(),
            onRedirect: (redirectType) => cubit.onRedirect(
                redirectType, _navigateToLogin, _navigateToUpdatedPage));
      case AuthTypes.email:
        return EmailComponent(
            isLogin: true,
            onConfirmEmail: _navigateToDashboard,
            onRedirect: (redirectType) => cubit.onRedirect(
                redirectType, _navigateToLogin, _navigateToUpdatedPage));
      case AuthTypes.linkedid:
        return LinkedinComponent(
            isLogin: true,
            onConfirmlinkedIn: _navigateToDashboard,
            onRedirect: (redirectType) => cubit.onRedirect(
                redirectType, _navigateToLogin, _navigateToUpdatedPage));
      case AuthTypes.code:
        return CodeComponent(
            onConfirmCode: _navigateToDashboard,
            onRedirect: (redirectType) => cubit.onRedirect(
                redirectType, _navigateToLogin, _navigateToUpdatedPage));
    }
  }

  void _navigateToUpdatedPage() {
    final state = cubit.state;
    context
        .go(context.namedLocation('${RoutesNames.logIn}/${state.pageState}'));
  }

  void _navigateToLogin() {
    final state = cubit.state;
    if (state.pageState == AuthTypes.phone ||
        state.pageState == AuthTypes.email) {
      context.push(
          context.namedLocation('${RoutesNames.signUp}/${state.pageState}'));
    } else {
      context.push(context.namedLocation(RoutesNames.signUp));
    }
  }

  void _navigateToDashboard() {
    context.go(Routes.dashboard);
  }
}
