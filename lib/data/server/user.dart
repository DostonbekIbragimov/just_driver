import 'package:json_annotation/json_annotation.dart';
import 'package:just_driver/data/server/user_roles.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String? id;
  int? number;
  String? phone;
  Object? phone_verified_at;
  String? first_name;
  String? last_name;
  String? birth_date;
  String? gender;
  String? avatar_url;
  bool? license_verified;
  String? role;
  int? balance;
  String? status;
  String? created_at;
  String? updated_at;
  Object? deleted_at;
  String? auth_token;
  List<UserRoles>? roles;

  User(
      {this.id,
      this.number,
      this.phone,
      this.phone_verified_at,
      this.first_name,
      this.last_name,
      this.birth_date,
      this.gender,
      this.avatar_url,
      this.license_verified,
      this.role,
      this.balance,
      this.status,
      this.created_at,
      this.updated_at,
      this.deleted_at,
      this.auth_token,
      this.roles});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
