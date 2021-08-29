import 'package:dio/dio.dart';
import 'package:just_driver/data/server/auth/LoginRequest.dart';
import 'package:just_driver/data/server/auth/LoginResponse.dart';
import 'package:just_driver/data/storage/storageUtil.dart';
import 'package:just_driver/data/utils/constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part "ApiClientService.dart";

@RestApi(baseUrl: BASE_URL)
abstract class ApiClient {
  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    var customHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'x-device-type': 'android',
      'x-device-app-version': "1.0.0",
      'x-device-lang': "uz",
      'x-device-model': "ANDROID XIOMI",
      'x-device-os-version': "u21us",
      'x-device-push-token': StorageUtil.getToken(),
      'x-device-uid': "1.0.0",
      'x-app': 'driver',
    };
    dio.options.headers.addAll(customHeaders);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST("auth/login")
  Future<LoginResponse> login(@Body() LoginRequest registerRequest);
}
