// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUpdateInfoImpl _$$AppUpdateInfoImplFromJson(Map<String, dynamic> json) =>
    _$AppUpdateInfoImpl(
      iosVersion: json['ios_version'] == null
          ? 0
          : const IntegerConverter().fromJson(json['ios_version']),
      androidVersion: json['android_version'] == null
          ? 0
          : const IntegerConverter().fromJson(json['android_version']),
      force: json['force'] == null
          ? false
          : const BooleanConverter().fromJson(json['force']),
      popup: json['popup'] == null
          ? false
          : const BooleanConverter().fromJson(json['popup']),
    );

Map<String, dynamic> _$$AppUpdateInfoImplToJson(_$AppUpdateInfoImpl instance) =>
    <String, dynamic>{
      'ios_version': const IntegerConverter().toJson(instance.iosVersion),
      'android_version':
          const IntegerConverter().toJson(instance.androidVersion),
      'force': const BooleanConverter().toJson(instance.force),
      'popup': const BooleanConverter().toJson(instance.popup),
    };
