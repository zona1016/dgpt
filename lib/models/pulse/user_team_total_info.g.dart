// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_team_total_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTeamTotalInfo _$UserTeamTotalInfoFromJson(Map<String, dynamic> json) =>
    UserTeamTotalInfo(
      (json['memberCount'] as num?)?.toInt() ?? 0,
      (json['realMemberCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UserTeamTotalInfoToJson(UserTeamTotalInfo instance) =>
    <String, dynamic>{
      'memberCount': instance.memberCount,
      'realMemberCount': instance.realMemberCount,
    };
