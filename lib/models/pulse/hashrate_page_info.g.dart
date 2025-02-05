// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hashrate_page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HasratePageInfoImpl _$$HasratePageInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$HasratePageInfoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      amount: (json['amount'] as num?)?.toInt() ?? 0,
      profitPreHour: (json['profitPreHour'] as num?)?.toDouble() ?? 0,
      profitPreDay: (json['profitPreDay'] as num?)?.toDouble() ?? 0,
      profitTotal: (json['profitTotal'] as num?)?.toDouble() ?? 0,
      profitRate: (json['profitRate'] as num?)?.toDouble() ?? 0,
      cycle: (json['cycle'] as num?)?.toInt() ?? 0,
      purchaseLimitType: (json['purchaseLimitType'] as num?)?.toInt() ?? 0,
      purchaseLimitQuantity:
          (json['purchaseLimitQuantity'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      enable: (json['enable'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$HasratePageInfoImplToJson(
        _$HasratePageInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'amount': instance.amount,
      'profitPreHour': instance.profitPreHour,
      'profitPreDay': instance.profitPreDay,
      'profitTotal': instance.profitTotal,
      'profitRate': instance.profitRate,
      'cycle': instance.cycle,
      'purchaseLimitType': instance.purchaseLimitType,
      'purchaseLimitQuantity': instance.purchaseLimitQuantity,
      'description': instance.description,
      'remark': instance.remark,
      'enable': instance.enable,
    };
