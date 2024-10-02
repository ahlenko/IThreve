import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/data/requests/login_request.dart';
import 'package:ithreve_web/domain/usecase/login_usecase.dart';
import 'package:ithreve_web/ui/pages/auth/content/auth_content_types.dart';
import 'package:ithreve_web/ui/pages/auth/login/login_page_state.dart';

@Injectable()
class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit(this._loginUseCase) : super(LoginPageState());

  final LoginUseCase _loginUseCase;

  Future<void> login() async {
    final response = await _loginUseCase.execute(
      LoginRequest(
        type: 'type',
        email: 'email',
        phone: 'phone',
        password: 'password',
      ),
    );

    response.fold((left) {
      // left is's error
      // must create variable Failure error is state and emit this
    }, (right) {
      // right it's model of login - success result
    });
  }

  onRedirect(String redirectTo, VoidCallback navigateToLogin,
      VoidCallback navigateToUpdatedPage,
      {bool fromInit = false}) {
    switch (redirectTo) {
      case AuthTypes.signUp:
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
