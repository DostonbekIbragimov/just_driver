import 'dart:core';

import '../errors.dart';
import '../exist.dart';

class LoginResponse {
  bool status;
  String message;
  Exist data;
  List<Errors> errors;

  LoginResponse(
      {required this.status,
        required this.message,
        required this.data,
        required this.errors});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        status: json['status'],
        message: json['message'],
        data: json['data'],
        errors: json['errors']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    data['errors'] = this.errors;
    return data;
  }
}
