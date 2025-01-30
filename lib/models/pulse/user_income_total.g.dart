// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_income_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserIncomeTotal _$UserIncomeTotalFromJson(Map<String, dynamic> json) =>
    UserIncomeTotal(
      (json['today'] as num?)?.toInt() ?? 0,
      (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UserIncomeTotalToJson(UserIncomeTotal instance) =>
    <String, dynamic>{
      'today': instance.today,
      'total': instance.total,
    };
