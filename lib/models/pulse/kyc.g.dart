// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kyc _$KycFromJson(Map<String, dynamic> json) => Kyc(
      id: (json['id'] as num?)?.toInt() ?? 0,
      createTime: json['createTime'] as String? ?? '',
      updateTime: json['updateTime'] as String? ?? '',
      createUserId: (json['createUserId'] as num?)?.toInt() ?? 0,
      createUserName: json['createUserName'] as String? ?? '',
      updateUserId: (json['updateUserId'] as num?)?.toInt() ?? 0,
      updateUserName: json['updateUserName'] as String? ?? '',
      isDelete: json['isDelete'] as bool? ?? false,
      sysExtInfo: json['sysExtInfo'] as String? ?? '',
      description: json['description'] as String? ?? 'string',
      enable: (json['enable'] as num?)?.toInt() ?? 0,
      remark: json['remark'] as String? ?? 'string',
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      userFkDisplayName: json['userFkDisplayName'] as String? ?? '',
      realName: json['realName'] as String? ?? '',
      idType: (json['idType'] as num?)?.toInt() ?? 0,
      idValue: json['idValue'] as String? ?? '',
      imageFileId: (json['imageFileId'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 0,
      auditDate: json['auditDate'] as String? ?? '',
      auditResult: json['auditResult'] as String? ?? '',
    );

Map<String, dynamic> _$KycToJson(Kyc instance) => <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'createUserId': instance.createUserId,
      'createUserName': instance.createUserName,
      'updateUserId': instance.updateUserId,
      'updateUserName': instance.updateUserName,
      'isDelete': instance.isDelete,
      'sysExtInfo': instance.sysExtInfo,
      'description': instance.description,
      'enable': instance.enable,
      'remark': instance.remark,
      'userId': instance.userId,
      'userFkDisplayName': instance.userFkDisplayName,
      'realName': instance.realName,
      'idType': instance.idType,
      'idValue': instance.idValue,
      'imageFileId': instance.imageFileId,
      'status': instance.status,
      'auditDate': instance.auditDate,
      'auditResult': instance.auditResult,
    };
