import 'package:json_annotation/json_annotation.dart';
import 'package:just_driver/data/server/errors.dart';
import 'package:just_driver/data/server/user.dart';

part 'ConfirmResponse.g.dart';

@JsonSerializable(explicitToJson: true)
class ConfirmResponse {
  bool? status;
  String? message;
  User? data;
  List<Errors>? errors;

  ConfirmResponse({this.status, this.message, this.data, this.errors});

  factory ConfirmResponse.fromJson(Map<String, dynamic> json) => _$ConfirmResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmResponseToJson(this);
}
