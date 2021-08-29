import 'package:alice/alice.dart';
import 'package:dio/dio.dart';
import 'package:just_driver/core/constants/constants.dart';
import 'package:just_driver/data/models/auth/LoginRequest.dart';
import 'package:just_driver/data/models/auth/LoginResponse.dart';
import 'package:just_driver/data/storage/storageUtil.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part "api_client.g.dart";

/// Generate g file command=> flutter pub run build_runner build --delete-conflicting-outputs
@RestApi(baseUrl: Constants.baseUrl)
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
  static Alice alice = Alice(
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));

    ///Alice chuck interceptor
    dio.interceptors.add(alice.getDioInterceptor());

    dio.interceptors.add(
        LogInterceptor(responseBody: true, requestBody: true, request: true));
    return dio;
  }

  static CancelToken cancelToken = CancelToken();

  static ApiClient? _apiClient;

  static ApiClient getInstance({String baseUrl = Constants.baseUrl}) {
    if (_apiClient != null)
      return _apiClient!;
    else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }


  @POST("auth/login")
  Future<LoginResponse> login(@Body() LoginRequest registerRequest);
}
