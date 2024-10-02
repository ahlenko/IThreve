import 'package:dio/dio.dart' hide Headers;
import 'package:ithreve_web/app/constants/links.dart';
import 'package:ithreve_web/app/di/di.dart';
import 'package:ithreve_web/data/network/client.dart';
import 'package:ithreve_web/data/requests/login_request.dart';
import 'package:ithreve_web/data/response/login_response.dart';

import 'package:retrofit/retrofit.dart';

part 'api_container.g.dart';

@RestApi(baseUrl: ConstantsLinks.baseApiUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST('/login')
  Future<LoginResponse> login(
    @Body() LoginRequest data,
  );
}

AppServiceClient initClient() {
  final dio = getIt.get<DioFactory>().getDio(ConstantsLinks.baseApiUrl);

  return AppServiceClient(
    dio,
  );
}
