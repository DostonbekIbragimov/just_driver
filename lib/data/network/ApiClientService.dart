import 'package:just_driver/data/network/ApiClient.dart';
import 'package:just_driver/data/server/auth/LoginRequest.dart';
import 'package:just_driver/data/server/auth/LoginResponse.dart';

part of 'ApiClient.dart';

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {required this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://branch-user.api.delever.uz/v1/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<LoginResponse> signIn(shipperId, registerRequest) async {
    ArgumentError.checkNotNull(shipperId, 'shipperId');
    ArgumentError.checkNotNull(registerRequest, 'registerRequest');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(registerRequest?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'branch-users/login',
        queryParameters: queryParameters,

        data: _data);
    final value = LoginResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<LoginResponse> login(LoginRequest registerRequest) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
