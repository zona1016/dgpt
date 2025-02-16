// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direct_top_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DirectTopInfo _$DirectTopInfoFromJson(Map<String, dynamic> json) =>
    DirectTopInfo(
      json['user'] == null
          ? null
          : UserInfo.fromJson(json['user'] as Map<String, dynamic>),
      json['hashrate'] == null
          ? null
          : PowerInfo.fromJson(json['hashrate'] as Map<String, dynamic>),
      (json['teamCount'] as num?)?.toInt() ?? 0,
      (json['directCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DirectTopInfoToJson(DirectTopInfo instance) =>
    <String, dynamic>{
      'user': instance.user,
      'hashrate': instance.hashrate,
      'teamCount': instance.teamCount,
      'directCount': instance.directCount,
    };

SysOrg _$SysOrgFromJson(Map<String, dynamic> json) => SysOrg(
      (json['id'] as num?)?.toInt() ?? 0,
      json['createTime'] as String? ?? '',
      json['updateTime'] as String? ?? '',
      (json['createUserId'] as num?)?.toInt() ?? 0,
      json['createUserName'] as String? ?? '',
      (json['updateUserId'] as num?)?.toInt() ?? 0,
      json['updateUserName'] as String? ?? '',
      json['isDelete'] as bool? ?? false,
      (json['tenantId'] as num?)?.toInt() ?? 0,
      (json['pid'] as num?)?.toInt() ?? 0,
      json['name'] as String? ?? '',
      json['code'] as String? ?? '',
      (json['level'] as num?)?.toInt() ?? 0,
      json['type'] as String? ?? '',
      (json['directorId'] as num?)?.toInt() ?? 0,
      (json['orderNo'] as num?)?.toInt() ?? 0,
      (json['status'] as num?)?.toInt() ?? 0,
      json['remark'] as String? ?? '',
      (json['children'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      json['disabled'] as bool? ?? false,
    );

Map<String, dynamic> _$SysOrgToJson(SysOrg instance) => <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'createUserId': instance.createUserId,
      'createUserName': instance.createUserName,
      'updateUserId': instance.updateUserId,
      'updateUserName': instance.updateUserName,
      'isDelete': instance.isDelete,
      'tenantId': instance.tenantId,
      'pid': instance.pid,
      'name': instance.name,
      'code': instance.code,
      'level': instance.level,
      'type': instance.type,
      'directorId': instance.directorId,
      'orderNo': instance.orderNo,
      'status': instance.status,
      'remark': instance.remark,
      'children': instance.children,
      'disabled': instance.disabled,
    };
