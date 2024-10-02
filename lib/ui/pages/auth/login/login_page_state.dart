import 'package:ithreve_web/ui/pages/auth/content/auth_content_types.dart';

class LoginPageState {
  final String pageState;

  LoginPageState({this.pageState = AuthTypes.phone});

  LoginPageState copyWith({String? pageState}) {
    return LoginPageState(pageState: pageState ?? this.pageState);
  }
}
