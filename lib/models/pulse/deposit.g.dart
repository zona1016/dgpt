// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Deposit _$DepositFromJson(Map<String, dynamic> json) => Deposit(
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
      merchantId: (json['merchantId'] as num?)?.toInt() ?? 0,
      merchantSnapshot: json['merchantSnapshot'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      address: json['address'] as String? ?? '',
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      depositFileId: (json['depositFileId'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 0,
      auditDate: json['auditDate'] as String? ?? '',
      auditResult: json['auditResult'] as String? ?? '',
    );

Map<String, dynamic> _$DepositToJson(Deposit instance) => <String, dynamic>{
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
      'merchantId': instance.merchantId,
      'merchantSnapshot': instance.merchantSnapshot,
      'currency': instance.currency,
      'address': instance.address,
      'amount': instance.amount,
      'depositFileId': instance.depositFileId,
      'status': instance.status,
      'auditDate': instance.auditDate,
      'auditResult': instance.auditResult,
    };
