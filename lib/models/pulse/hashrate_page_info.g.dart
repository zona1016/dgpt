// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hashrate_page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HasratePageInfoImpl _$$HasratePageInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$HasratePageInfoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      createTime: json['createTime'] as String? ?? '',
      updateTime: json['updateTime'] as String? ?? '',
      createUserId: (json['createUserId'] as num?)?.toInt() ?? 0,
      createUserName: json['createUserName'] as String? ?? '',
      updateUserId: (json['updateUserId'] as num?)?.toInt() ?? 0,
      updateUserName: json['updateUserName'] as String? ?? '',
      isDelete: json['isDelete'] as bool? ?? false,
      sysExtInfo: json['sysExtInfo'] as String? ?? '',
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      condition: json['condition'] as String? ?? '',
      firstLayer: (json['firstLayer'] as num?)?.toInt() ?? 0,
      secondLayer: (json['secondLayer'] as num?)?.toInt() ?? 0,
      thirdLayer: (json['thirdLayer'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      enable: (json['enable'] as num?)?.toInt() ?? 0,
      remark: json['remark'] as String? ?? '',
    );

Map<String, dynamic> _$$HasratePageInfoImplToJson(
        _$HasratePageInfoImpl instance) =>
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
      'condition': instance.condition,
      'firstLayer': instance.firstLayer,
      'secondLayer': instance.secondLayer,
      'thirdLayer': instance.thirdLayer,
      'description': instance.description,
      'enable': instance.enable,
      'remark': instance.remark,
    };
