import 'package:ithreve_web/ui/pages/auth/content/auth_content_types.dart';

class SignUpPageState {
  final String pageState;

  SignUpPageState({this.pageState = AuthTypes.welcome});

  SignUpPageState copyWith({String? pageState}) {
    return SignUpPageState(pageState: pageState ?? this.pageState);
  }
}
