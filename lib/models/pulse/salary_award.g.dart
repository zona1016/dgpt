// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salary_award.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryAward _$SalaryAwardFromJson(Map<String, dynamic> json) => SalaryAward(
      (json['id'] as num?)?.toInt() ?? 0,
      (json['planAmountTotal'] as num?)?.toDouble() ?? 0,
      (json['monthPlanAmount'] as num?)?.toDouble() ?? 0,
      json['jobTitleSnapshot'] as String? ?? '',
      json['calculateDate'] as String? ?? '',
      (json['amount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$SalaryAwardToJson(SalaryAward instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planAmountTotal': instance.planAmountTotal,
      'monthPlanAmount': instance.monthPlanAmount,
      'jobTitleSnapshot': instance.jobTitleSnapshot,
      'calculateDate': instance.calculateDate,
      'amount': instance.amount,
    };
