// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomeHistory _$IncomeHistoryFromJson(Map<String, dynamic> json) =>
    IncomeHistory(
      (json['id'] as num?)?.toInt() ?? 0,
      json['roiDate'] as String? ?? '',
      (json['amount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$IncomeHistoryToJson(IncomeHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roiDate': instance.roiDate,
      'amount': instance.amount,
    };
