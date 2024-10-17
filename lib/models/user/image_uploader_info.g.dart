// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_uploader_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageUploaderInfo _$ImageUploaderInfoFromJson(Map<String, dynamic> json) =>
    ImageUploaderInfo(
      (json['code'] as num).toInt(),
      json['msg'] as String,
      json['time'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageUploaderInfoToJson(ImageUploaderInfo instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'time': instance.time,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['url'] as String,
      json['fullurl'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'url': instance.url,
      'fullurl': instance.fullUrl,
    };
