// GENERATED CODE - DO NOT MODIFY BY HAND

part of 're_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReUserInfo _$ReUserInfoFromJson(Map<String, dynamic> json) => ReUserInfo(
      json['referenceUser'] == null
          ? null
          : UserInfo.fromJson(json['referenceUser'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : UserInfo.fromJson(json['user'] as Map<String, dynamic>),
      json['hashrate'] == null
          ? null
          : PlanDetail.fromJson(json['hashrate'] as Map<String, dynamic>),
      json['isValid'] as bool? ?? false,
      (json['totalRent'] as num?)?.toInt() ?? 0,
      (json['totalMember'] as num?)?.toInt() ?? 0,
      (json['totalProfit'] as num?)?.toInt() ?? 0,
      (json['totalSubscription'] as num?)?.toInt() ?? 0,
      (json['totalRevenue'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ReUserInfoToJson(ReUserInfo instance) =>
    <String, dynamic>{
      'referenceUser': instance.referenceUser,
      'user': instance.user,
      'hashrate': instance.planDetail,
      'isValid': instance.isValid,
      'totalRent': instance.totalRent,
      'totalMember': instance.totalMember,
      'totalProfit': instance.totalProfit,
      'totalSubscription': instance.totalSubscription,
      'totalRevenue': instance.totalRevenue,
    };
