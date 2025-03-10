// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlowInfo _$FlowInfoFromJson(Map<String, dynamic> json) => FlowInfo(
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
      type: (json['type'] as num?)?.toInt() ?? 0,
      fromAccount: (json['fromAccount'] as num?)?.toInt() ?? 0,
      toAccount: (json['toAccount'] as num?)?.toInt() ?? 0,
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      targetAccount: json['targetAccount'] as String? ?? '',
      createDate: json['createDate'] as String? ?? '',
      auditDate: json['auditDate'] as String? ?? '',
      orderSn: json['orderSn'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FlowInfoToJson(FlowInfo instance) => <String, dynamic>{
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
      'type': instance.type,
      'fromAccount': instance.fromAccount,
      'toAccount': instance.toAccount,
      'status': instance.status,
      'balance': instance.balance,
      'amount': instance.amount,
      'targetAccount': instance.targetAccount,
      'orderSn': instance.orderSn,
      'auditDate': instance.auditDate,
      'createDate': instance.createDate,
    };
