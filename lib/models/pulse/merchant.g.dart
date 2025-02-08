// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Merchant _$MerchantFromJson(Map<String, dynamic> json) => Merchant(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['currency'] as String?,
      json['address'] as String?,
      (json['minAmount'] as num?)?.toInt(),
      (json['maxAmount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MerchantToJson(Merchant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'currency': instance.currency,
      'address': instance.address,
      'minAmount': instance.minAmount,
      'maxAmount': instance.maxAmount,
    };
