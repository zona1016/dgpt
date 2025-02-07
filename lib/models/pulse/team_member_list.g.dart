// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_member_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamMemberList _$TeamMemberListFromJson(Map<String, dynamic> json) =>
    TeamMemberList(
      json['account'] as String?,
      json['realName'] as String?,
      json['email'] as String?,
      json['hashrateCode'] as String?,
      json['hashrateName'] as String?,
    );

Map<String, dynamic> _$TeamMemberListToJson(TeamMemberList instance) =>
    <String, dynamic>{
      'account': instance.account,
      'realName': instance.realName,
      'email': instance.email,
      'hashrateCode': instance.hashrateCode,
      'hashrateName': instance.hashrateName,
    };
