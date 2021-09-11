import 'dart:core';

import 'package:just_driver/data/server/RegisterData.dart';
import 'package:just_driver/data/server/errors.dart';

class RegisterResponse {
  bool? status;
  String? message;
  RegisterData? data;
  List<Errors>? errors;

  RegisterResponse({this.status, this.message, this.data, this.errors});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = RegisterData.fromJson(json['data']);
    }
    errors = <Errors>[];
    if (json['errors'] != null) {
      json['errors'].forEach((v) {
        errors?.add(Errors.fromJson(v));
      });
    }
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
