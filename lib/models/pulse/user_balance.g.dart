// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserBalanceImpl _$$UserBalanceImplFromJson(Map<String, dynamic> json) =>
    _$UserBalanceImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      type: (json['type'] as num?)?.toInt() ?? 0,
      balance: (json['balance'] as num?)?.toDouble() ?? 0,
      lockBalance: (json['lockBalance'] as num?)?.toDouble() ?? 0,
      currency: json['currency'] as String? ?? '',
    );

Map<String, dynamic> _$$UserBalanceImplToJson(_$UserBalanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'balance': instance.balance,
      'lockBalance': instance.lockBalance,
      'currency': instance.currency,
    };
