// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layer_hashrate_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LayerHashrateInfo _$LayerHashrateInfoFromJson(Map<String, dynamic> json) =>
    LayerHashrateInfo(
      json['hashrate'] == null
          ? null
          : PowerInfo.fromJson(json['hashrate'] as Map<String, dynamic>),
      (json['count'] as num?)?.toInt() ?? 0,
      (json['memberList'] as List<dynamic>?)
              ?.map((e) => MemberList.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$LayerHashrateInfoToJson(LayerHashrateInfo instance) =>
    <String, dynamic>{
      'hashrate': instance.hashrate,
      'count': instance.count,
      'memberList': instance.memberList,
    };

MemberList _$MemberListFromJson(Map<String, dynamic> json) => MemberList(
      json['powerInfo'] == null
          ? null
          : PowerInfo.fromJson(json['powerInfo'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : DirectTopInfo.fromJson(json['user'] as Map<String, dynamic>),
      json['planValid'] as bool? ?? false,
      (json['teamUserCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MemberListToJson(MemberList instance) =>
    <String, dynamic>{
      'powerInfo': instance.powerInfo,
      'user': instance.user,
      'planValid': instance.planValid,
      'teamUserCount': instance.teamUserCount,
    };
