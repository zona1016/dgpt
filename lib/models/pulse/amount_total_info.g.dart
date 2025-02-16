// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_total_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AmountTotalInfoImpl _$$AmountTotalInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$AmountTotalInfoImpl(
      planAmountTotal: (json['planAmountTotal'] as num?)?.toDouble() ?? 0,
      directAwardAmountTotal:
          (json['directAwardAmountTotal'] as num?)?.toDouble() ?? 0,
      teamAwardAmountTotal:
          (json['teamAwardAmountTotal'] as num?)?.toDouble() ?? 0,
      roiAmountTotal: (json['roiAmountTotal'] as num?)?.toDouble() ?? 0,
      salaryAmountTotal: (json['salaryAmountTotal'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$AmountTotalInfoImplToJson(
        _$AmountTotalInfoImpl instance) =>
    <String, dynamic>{
      'planAmountTotal': instance.planAmountTotal,
      'directAwardAmountTotal': instance.directAwardAmountTotal,
      'teamAwardAmountTotal': instance.teamAwardAmountTotal,
      'roiAmountTotal': instance.roiAmountTotal,
      'salaryAmountTotal': instance.salaryAmountTotal,
    };
