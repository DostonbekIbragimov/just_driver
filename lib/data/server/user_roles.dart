import 'package:json_annotation/json_annotation.dart';

part 'user_roles.g.dart';

@JsonSerializable()
class UserRoles {
  int? id;
  String? slug;
  String? name;
  Object? permissions;
  String? created_at;
  String? updated_at;

  UserRoles({this.id, this.slug, this.name, this.permissions, this.created_at, this.updated_at});

  factory UserRoles.fromJson(Map<String, dynamic> json) => _$UserRolesFromJson(json);

  Map<String, dynamic> toJson() => _$UserRolesToJson(this);
}
