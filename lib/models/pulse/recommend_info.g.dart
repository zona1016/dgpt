// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendInfo _$RecommendInfoFromJson(Map<String, dynamic> json) =>
    RecommendInfo(
      json['account'] as String? ?? '',
      (json['planAmount'] as num?)?.toInt() ?? 0,
      (json['awardAmount'] as num?)?.toDouble() ?? 0,
      json['createTime'] as String? ?? '',
    );

Map<String, dynamic> _$RecommendInfoToJson(RecommendInfo instance) =>
    <String, dynamic>{
      'account': instance.account,
      'planAmount': instance.planAmount,
      'awardAmount': instance.awardAmount,
      'createTime': instance.createTime,
    };
