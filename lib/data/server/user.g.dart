// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String?,
    number: json['number'] as int?,
    phone: json['phone'] as String?,
    phone_verified_at: json['phone_verified_at'],
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    birth_date: json['birth_date'] as String?,
    gender: json['gender'] as String?,
    avatar_url: json['avatar_url'] as String?,
    license_verified: json['license_verified'] as bool?,
    role: json['role'] as String?,
    balance: json['balance'] as int?,
    status: json['status'] as String?,
    created_at: json['created_at'] as String?,
    updated_at: json['updated_at'] as String?,
    deleted_at: json['deleted_at'],
    auth_token: json['auth_token'] as String?,
    roles: (json['roles'] as List<dynamic>?)
        ?.map((e) => UserRoles.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'phone': instance.phone,
      'phone_verified_at': instance.phone_verified_at,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'birth_date': instance.birth_date,
      'gender': instance.gender,
      'avatar_url': instance.avatar_url,
      'license_verified': instance.license_verified,
      'role': instance.role,
      'balance': instance.balance,
      'status': instance.status,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'deleted_at': instance.deleted_at,
      'auth_token': instance.auth_token,
      'roles': instance.roles?.map((e) => e.toJson()).toList(),
    };
