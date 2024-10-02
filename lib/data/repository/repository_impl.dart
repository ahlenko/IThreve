import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/data/data_source/remove_data_souce.dart';
import 'package:ithreve_web/data/network/error_handler.dart';
import 'package:ithreve_web/data/network/failure.dart';
import 'package:ithreve_web/data/requests/login_request.dart';
import 'package:ithreve_web/data/response/login_response.dart';
import 'package:ithreve_web/domain/repository/repository.dart';

@Injectable(as: Repository)
class MainRepositoryImpl extends Repository {
  MainRepositoryImpl(this._remoteDataSource);

  final RemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, LoginResponse>> login(
    LoginRequest input,
  ) async {
    try {
      final response = await _remoteDataSource.login(
        input,
      );

      return Right(response);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
