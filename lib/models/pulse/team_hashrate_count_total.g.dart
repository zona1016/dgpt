// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_hashrate_count_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamHashrateCountTotal _$TeamHashrateCountTotalFromJson(
        Map<String, dynamic> json) =>
    TeamHashrateCountTotal(
      json['code'] as String,
      json['name'] as String,
      (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$TeamHashrateCountTotalToJson(
        TeamHashrateCountTotal instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'count': instance.count,
    };
