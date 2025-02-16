// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enable_job_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnableJobInfoImpl _$$EnableJobInfoImplFromJson(Map<String, dynamic> json) =>
    _$EnableJobInfoImpl(
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      orderNo: (json['orderNo'] as num?)?.toInt() ?? 0,
      condition: json['condition'] as String? ?? '',
      salary: (json['salary'] as num?)?.toDouble() ?? 0,
      monthPlanAmount: (json['monthPlanAmount'] as num?)?.toDouble() ?? 0,
      description: json['description'] as String? ?? '',
      enable: (json['enable'] as num?)?.toInt() ?? 0,
      conditionInfo: json['conditionInfo'] == null
          ? null
          : ConditionInfo.fromJson(
              json['conditionInfo'] as Map<String, dynamic>),
      createTime: json['createTime'] as String? ?? '',
      isDelete: json['isDelete'] as bool? ?? false,
      id: (json['id'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$EnableJobInfoImplToJson(_$EnableJobInfoImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'orderNo': instance.orderNo,
      'condition': instance.condition,
      'salary': instance.salary,
      'monthPlanAmount': instance.monthPlanAmount,
      'description': instance.description,
      'enable': instance.enable,
      'conditionInfo': instance.conditionInfo,
      'createTime': instance.createTime,
      'isDelete': instance.isDelete,
      'id': instance.id,
    };

_$ConditionInfoImpl _$$ConditionInfoImplFromJson(Map<String, dynamic> json) =>
    _$ConditionInfoImpl(
      hashrateCode: json['hashrateCode'] as String? ?? '',
      directHashrateCode: json['directHashrateCode'] as String? ?? '',
      directHashrateCount: (json['directHashrateCount'] as num?)?.toInt() ?? 0,
      directJobTitleCode: json['directJobTitleCode'] as String? ?? '',
      directJobTitleCount: (json['directJobTitleCount'] as num?)?.toInt() ?? 0,
      teamPlanAmountTotal: (json['teamPlanAmountTotal'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ConditionInfoImplToJson(_$ConditionInfoImpl instance) =>
    <String, dynamic>{
      'hashrateCode': instance.hashrateCode,
      'directHashrateCode': instance.directHashrateCode,
      'directHashrateCount': instance.directHashrateCount,
      'directJobTitleCode': instance.directJobTitleCode,
      'directJobTitleCount': instance.directJobTitleCount,
      'teamPlanAmountTotal': instance.teamPlanAmountTotal,
    };
