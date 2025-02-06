// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hasrate_progress_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HasrateProgressInfoImpl _$$HasrateProgressInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$HasrateProgressInfoImpl(
      next: Next.fromJson(json['next'] as Map<String, dynamic>),
      planAmount: (json['planAmount'] as num).toInt(),
      directCount: (json['directCount'] as num).toInt(),
      teamCount: (json['teamCount'] as num).toInt(),
    );

Map<String, dynamic> _$$HasrateProgressInfoImplToJson(
        _$HasrateProgressInfoImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
      'planAmount': instance.planAmount,
      'directCount': instance.directCount,
      'teamCount': instance.teamCount,
    };

_$NextImpl _$$NextImplFromJson(Map<String, dynamic> json) => _$NextImpl(
      id: (json['id'] as num).toInt(),
      createTime: json['createTime'] as String,
      updateTime: json['updateTime'] as String,
      createUserId: (json['createUserId'] as num).toInt(),
      createUserName: json['createUserName'] as String,
      updateUserId: (json['updateUserId'] as num).toInt(),
      updateUserName: json['updateUserName'] as String,
      isDelete: json['isDelete'] as bool,
      sysExtInfo: json['sysExtInfo'] as String,
      code: json['code'] as String,
      name: json['name'] as String,
      orderNo: (json['orderNo'] as num).toInt(),
      condition: json['condition'] as String,
      firstLayer: (json['firstLayer'] as num).toInt(),
      secondLayer: (json['secondLayer'] as num).toInt(),
      thirdLayer: (json['thirdLayer'] as num).toInt(),
      description: json['description'] as String,
      enable: (json['enable'] as num).toInt(),
      remark: json['remark'] as String,
    );

Map<String, dynamic> _$$NextImplToJson(_$NextImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'createUserId': instance.createUserId,
      'createUserName': instance.createUserName,
      'updateUserId': instance.updateUserId,
      'updateUserName': instance.updateUserName,
      'isDelete': instance.isDelete,
      'sysExtInfo': instance.sysExtInfo,
      'code': instance.code,
      'name': instance.name,
      'orderNo': instance.orderNo,
      'condition': instance.condition,
      'firstLayer': instance.firstLayer,
      'secondLayer': instance.secondLayer,
      'thirdLayer': instance.thirdLayer,
      'description': instance.description,
      'enable': instance.enable,
      'remark': instance.remark,
    };
