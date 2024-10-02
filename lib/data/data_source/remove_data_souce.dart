import 'package:injectable/injectable.dart';
import 'package:ithreve_web/data/network/api_containers/api_container.dart';
import 'package:ithreve_web/data/requests/login_request.dart';
import 'package:ithreve_web/data/response/login_response.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(
    LoginRequest data,
  );
}

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImpl extends RemoteDataSource {
  final _client = initClient();

  @override
  Future<LoginResponse> login(LoginRequest data) {
    return _client.login(data);
  }
}
