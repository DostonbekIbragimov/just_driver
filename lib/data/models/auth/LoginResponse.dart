import 'dart:core';

import 'package:just_driver/data/server/errors.dart';
import 'package:just_driver/data/server/exist.dart';

class LoginResponse {
  bool? status;
  String? message;
  Exist? data;
  List<Errors>? errors;

  LoginResponse({this.status, this.message, this.data, this.errors});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = Exist.fromJson(json['data']);
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
