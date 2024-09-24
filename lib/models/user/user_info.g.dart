// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: (json['id'] as num?)?.toInt() ?? 0,
      imId: json['im_id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      nickname: json['nickname'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      score: (json['score'] as num?)?.toInt() ?? 0,
      token: json['token'] as String? ?? '',
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      createTime: (json['createtime'] as num?)?.toInt() ?? 0,
      expireTime: (json['expiretime'] as num?)?.toInt() ?? 0,
      expiresIn: (json['expires_in'] as num?)?.toInt() ?? 0,
      email: json['email'] as String? ?? '',
      userSign: json['userSign'] as String? ?? '',
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'im_id': instance.imId,
      'username': instance.username,
      'nickname': instance.nickname,
      'mobile': instance.mobile,
      'avatar': instance.avatar,
      'score': instance.score,
      'token': instance.token,
      'user_id': instance.userId,
      'createtime': instance.createTime,
      'expiretime': instance.expireTime,
      'expires_in': instance.expiresIn,
      'email': instance.email,
      'userSign': instance.userSign,
    };
