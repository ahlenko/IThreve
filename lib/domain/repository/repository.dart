import 'package:dartz/dartz.dart';
import 'package:ithreve_web/data/network/failure.dart';
import 'package:ithreve_web/data/requests/login_request.dart';
import 'package:ithreve_web/data/response/login_response.dart';

abstract class Repository {
  Future<Either<Failure, LoginResponse>> login(
    LoginRequest input,
  );
}
