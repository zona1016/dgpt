// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layer_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayerInfo _$LayerInfoFromJson(Map<String, dynamic> json) => LayerInfo(
      (json['layer'] as num?)?.toInt() ?? -1,
      (json['userCount'] as num?)?.toInt() ?? 0,
      (json['realUserCount'] as num?)?.toInt() ?? 0,
      (json['todyRoiTotal'] as num?)?.toDouble() ?? 0,
      (json['roiTotal'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$LayerInfoToJson(LayerInfo instance) => <String, dynamic>{
      'layer': instance.layer,
      'userCount': instance.userCount,
      'realUserCount': instance.realUserCount,
      'todyRoiTotal': instance.todyRoiTotal,
      'roiTotal': instance.roiTotal,
    };
