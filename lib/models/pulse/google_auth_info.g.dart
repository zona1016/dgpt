// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_auth_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleAuthInfo _$GoogleAuthInfoFromJson(Map<String, dynamic> json) =>
    GoogleAuthInfo(
      json['name'] as String? ?? '',
      json['secret'] as String? ?? '',
      json['isSuer'] as String? ?? '',
    );

Map<String, dynamic> _$GoogleAuthInfoToJson(GoogleAuthInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'secret': instance.secret,
      'isSuer': instance.isSuer,
    };
