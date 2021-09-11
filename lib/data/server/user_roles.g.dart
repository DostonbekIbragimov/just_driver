// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_roles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRoles _$UserRolesFromJson(Map<String, dynamic> json) {
  return UserRoles(
    id: json['id'] as int?,
    slug: json['slug'] as String?,
    name: json['name'] as String?,
    permissions: json['permissions'],
    created_at: json['created_at'] as String?,
    updated_at: json['updated_at'] as String?,
  );
}

Map<String, dynamic> _$UserRolesToJson(UserRoles instance) => <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'permissions': instance.permissions,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
