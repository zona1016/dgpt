// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pulse_base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel(
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
    );

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
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
    };
