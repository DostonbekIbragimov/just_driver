import 'package:dio/dio.dart';
import 'package:just_driver/base/base_repository.dart';
import 'package:just_driver/data/models/auth/LoginRequest.dart';
import 'package:just_driver/data/models/auth/LoginResponse.dart';
import 'package:just_driver/data/network/api_client.dart';
import 'package:just_driver/data/network/response_handler.dart';
import 'package:just_driver/data/network/server_error.dart';

class AuthRepository extends BaseRepository {
  final apiClient = ApiClient.getInstance();
  static AuthRepository _instance = AuthRepository._internal();

  AuthRepository._internal();

  factory AuthRepository() => _instance;

  Future<ResponseHandler<LoginResponse>> _fetchLogin(
      {required LoginRequest request}) async {
    LoginResponse response;
    try {
      response = await apiClient.login(request);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> login({required LoginRequest request}) async {
    final response = await _fetchLogin(request: request);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()!.getErrorMessage() != "Canceled") {
      return await getErrorMessage(response.getException()!.getErrorMessage());
    }
  }
}
