// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeInfo _$NoticeInfoFromJson(Map<String, dynamic> json) => NoticeInfo(
      json['title'] as String?,
      json['content'] as String?,
      (json['type'] as num?)?.toInt(),
      json['publicTime'] as String?,
    );

Map<String, dynamic> _$NoticeInfoToJson(NoticeInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'publicTime': instance.publicTime,
    };
