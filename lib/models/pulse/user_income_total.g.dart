// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_income_total.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserIncomeTotalImpl _$$UserIncomeTotalImplFromJson(
        Map<String, dynamic> json) =>
    _$UserIncomeTotalImpl(
      today: (json['today'] as num?)?.toInt() ?? 0,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$UserIncomeTotalImplToJson(
        _$UserIncomeTotalImpl instance) =>
    <String, dynamic>{
      'today': instance.today,
      'total': instance.total,
    };
