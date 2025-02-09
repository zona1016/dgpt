// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: (json['id'] as num?)?.toInt() ?? 0,
      account: json['account'] as String? ?? '',
      realName: json['realName'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      idCardNum: json['idCardNum'] as String? ?? '',
      email: json['email'] as String? ?? '',
      accountType: (json['accountType'] as num?)?.toInt() ?? 0,
      avatar: json['avatar'] as String? ?? '',
      introduction: (json['introduction'] as num?)?.toInt() ?? 0,
      address: (json['address'] as num?)?.toInt() ?? 0,
      signature: (json['signature'] as num?)?.toInt() ?? 0,
      orgId: (json['orgId'] as num?)?.toInt() ?? 0,
      orgName: json['orgName'] as String? ?? '',
      orgType: json['orgType'] as String? ?? '',
      posName: json['posName'] as String? ?? '',
      buttons: (json['buttons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      watermarkText: json['watermarkText'] as String? ?? '',
      tenantId: (json['tenantId'] as num?)?.toInt() ?? 0,
      roleIds: (json['roleIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      phoneNation: (json['phoneNation'] as num?)?.toInt() ?? 0,
      nickName: json['nickName'] as String? ?? '',
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'account': instance.account,
      'realName': instance.realName,
      'phone': instance.phone,
      'idCardNum': instance.idCardNum,
      'email': instance.email,
      'accountType': instance.accountType,
      'avatar': instance.avatar,
      'introduction': instance.introduction,
      'address': instance.address,
      'signature': instance.signature,
      'orgId': instance.orgId,
      'orgName': instance.orgName,
      'orgType': instance.orgType,
      'posName': instance.posName,
      'buttons': instance.buttons,
      'watermarkText': instance.watermarkText,
      'nickName': instance.nickName,
      'phoneNation': instance.phoneNation,
      'tenantId': instance.tenantId,
      'roleIds': instance.roleIds,
    };
