// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ConfirmResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmResponse _$ConfirmResponseFromJson(Map<String, dynamic> json) {
  return ConfirmResponse(
    status: json['status'] as bool?,
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : User.fromJson(json['data'] as Map<String, dynamic>),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => Errors.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ConfirmResponseToJson(ConfirmResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.toJson(),
      'errors': instance.errors?.map((e) => e.toJson()).toList(),
    };
