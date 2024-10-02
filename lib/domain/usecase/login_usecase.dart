import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/data/network/failure.dart';
import 'package:ithreve_web/data/requests/login_request.dart';
import 'package:ithreve_web/data/response/login_response.dart';
import 'package:ithreve_web/domain/repository/repository.dart';
import 'package:ithreve_web/domain/usecase/base_usecase.dart';

@Injectable()
class LoginUseCase
    implements BaseUseCase<LoginRequest, LoginResponse> {
  LoginUseCase(this._repository);
  final Repository _repository;

  @override
  Future<Either<Failure, LoginResponse>> execute(
    LoginRequest data,
  ) async {
    return _repository.login(
      data,
    );
  }
}
