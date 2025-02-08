// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_kyc_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserKYCInfoImpl _$$UserKYCInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserKYCInfoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      realName: json['realName'] as String? ?? '',
      idType: (json['idType'] as num?)?.toInt() ?? 0,
      idValue: json['idValue'] as String? ?? '',
      imageFileIdUrl: json['imageFileIdUrl'] as String? ?? '',
      imageFileId: (json['imageFileId'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 0,
      auditDate: json['auditDate'] as String? ?? '',
      auditResult: json['auditResult'] as String? ?? '',
      country: json['country'] as String? ?? '',
    );

Map<String, dynamic> _$$UserKYCInfoImplToJson(_$UserKYCInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'realName': instance.realName,
      'idType': instance.idType,
      'idValue': instance.idValue,
      'imageFileIdUrl': instance.imageFileIdUrl,
      'imageFileId': instance.imageFileId,
      'status': instance.status,
      'auditDate': instance.auditDate,
      'auditResult': instance.auditResult,
      'country': instance.country,
    };
