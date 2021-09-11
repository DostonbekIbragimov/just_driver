import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_driver/base/base_repository.dart';
import 'package:just_driver/data/models/auth/ConfirmRequest.dart';
import 'package:just_driver/data/models/auth/ConfirmResponse.dart';
import 'package:just_driver/data/models/auth/LoginRequest.dart';
import 'package:just_driver/data/models/auth/LoginResponse.dart';
import 'package:just_driver/data/models/auth/RegisterResponse.dart';
import 'package:just_driver/data/network/api_client.dart';
import 'package:just_driver/data/network/response_handler.dart';
import 'package:just_driver/data/network/server_error.dart';

class AuthRepository extends BaseRepository {
  final apiClient = ApiClient.getInstance();
  static AuthRepository _instance = AuthRepository._internal();

  AuthRepository._internal();

  factory AuthRepository() => _instance;

  Future<ResponseHandler<LoginResponse>> _fetchLogin({required LoginRequest request}) async {
    LoginResponse response;
    try {
      response = await apiClient.login(request);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()..setException(ServerError.withError(error: error as DioError));
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

  Future<ResponseHandler<RegisterResponse>> _fetchRegister({required FormData request}) async {
    RegisterResponse response;
    try {
      response = await apiClient.register(request);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> register(
      {required XFile? file,
      required String phone,
      required String firstName,
      required String lastName,
      required String gender,
      required String role,
      required String address,
      required String birthDate}) async {
    var formData = FormData();

    formData.files.addAll([
      MapEntry(
        'avatar',
        MultipartFile.fromFileSync(file!.path, filename: '${file.hashCode}-image.png'),
      ),
    ]);
    formData.fields.addAll([
      MapEntry("phone", phone),
      MapEntry("first_name", firstName),
      MapEntry("last_name", lastName),
      MapEntry("gender", gender),
      MapEntry("role", role),
      MapEntry("address_name", address),
      MapEntry("birth_date", birthDate),
    ]);
    final response = await _fetchRegister(request: formData);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()!.getErrorMessage() != "Canceled") {
      return await getErrorMessage(response.getException()!.getErrorMessage());
    }
  }

  Future<ResponseHandler<ConfirmResponse>> _fetchConfirm({required ConfirmRequest request}) async {
    ConfirmResponse response;
    try {
      response = await apiClient.confirm(request);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> confirm({required ConfirmRequest request}) async {
    final response = await _fetchConfirm(request: request);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()!.getErrorMessage() != "Canceled") {
      return await getErrorMessage(response.getException()!.getErrorMessage());
    }
  }
}
