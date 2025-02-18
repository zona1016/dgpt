// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_award_total_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendAwardTotalInfo _$RecommendAwardTotalInfoFromJson(
        Map<String, dynamic> json) =>
    RecommendAwardTotalInfo(
      (json['amountTotal'] as num?)?.toDouble() ?? 0,
      (json['memberCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$RecommendAwardTotalInfoToJson(
        RecommendAwardTotalInfo instance) =>
    <String, dynamic>{
      'amountTotal': instance.amountTotal,
      'memberCount': instance.memberCount,
    };
