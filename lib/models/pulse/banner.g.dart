// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
      id: (json['id'] as num?)?.toInt() ?? 0,
      createTime: json['createTime'] as String? ?? '',
      updateTime: json['updateTime'] as String? ?? '',
      createUserId: (json['createUserId'] as num?)?.toInt() ?? 0,
      createUserName: json['createUserName'] as String? ?? '',
      updateUserId: (json['updateUserId'] as num?)?.toInt() ?? 0,
      updateUserName: json['updateUserName'] as String? ?? '',
      isDelete: json['isDelete'] as bool? ?? false,
      sysExtInfo: json['sysExtInfo'] as String? ?? '',
      description: json['description'] as String? ?? 'string',
      enable: (json['enable'] as num?)?.toInt() ?? 0,
      remark: json['remark'] as String? ?? 'string',
      sort: (json['sort'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? 'string',
      imageFileId: (json['imageFileId'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'id': instance.id,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'createUserId': instance.createUserId,
      'createUserName': instance.createUserName,
      'updateUserId': instance.updateUserId,
      'updateUserName': instance.updateUserName,
      'isDelete': instance.isDelete,
      'sysExtInfo': instance.sysExtInfo,
      'description': instance.description,
      'enable': instance.enable,
      'remark': instance.remark,
      'sort': instance.sort,
      'title': instance.title,
      'imageFileId': instance.imageFileId,
    };
