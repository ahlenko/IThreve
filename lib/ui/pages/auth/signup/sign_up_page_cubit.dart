import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/auth/content/auth_content_types.dart';
import 'package:ithreve_web/ui/pages/auth/signup/sign_up_page_state.dart';

@Injectable()
class SignUpPageCubit extends Cubit<SignUpPageState> {
  SignUpPageCubit() : super(SignUpPageState());

  onRedirect(String redirectTo, VoidCallback navigateToLogin,
      VoidCallback navigateToUpdatedPage,
      {bool fromInit = false}) {
    switch (redirectTo) {
      case AuthTypes.logIn:
        navigateToLogin();
        break;
      case AuthTypes.linkedid:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case AuthTypes.phone:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case AuthTypes.email:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
      case AuthTypes.code:
        emit(state.copyWith(pageState: redirectTo));
        if (!fromInit) navigateToUpdatedPage();
        break;
    }
  }

  onConfirmPhone() {
    emit(state.copyWith(pageState: AuthTypes.code));
  }
}
