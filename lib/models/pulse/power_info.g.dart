// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'power_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PowerInfoImpl _$$PowerInfoImplFromJson(Map<String, dynamic> json) =>
    _$PowerInfoImpl(
      createDate: json['createDate'] as String? ?? '',
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      firstLayer: (json['firstLayer'] as num?)?.toDouble() ?? 0.0,
      secondLayer: (json['secondLayer'] as num?)?.toDouble() ?? 0.0,
      thirdLayer: (json['thirdLayer'] as num?)?.toDouble() ?? 0.0,
      description: json['description'] as String? ?? '',
      orderNo: (json['orderNo'] as num?)?.toInt() ?? 0,
      enable: (json['enable'] as num?)?.toInt() ?? 0,
      createTime: json['createTime'] as String? ?? '',
    );

Map<String, dynamic> _$$PowerInfoImplToJson(_$PowerInfoImpl instance) =>
    <String, dynamic>{
      'createDate': instance.createDate,
      'code': instance.code,
      'name': instance.name,
      'firstLayer': instance.firstLayer,
      'secondLayer': instance.secondLayer,
      'thirdLayer': instance.thirdLayer,
      'description': instance.description,
      'orderNo': instance.orderNo,
      'enable': instance.enable,
      'createTime': instance.createTime,
    };
