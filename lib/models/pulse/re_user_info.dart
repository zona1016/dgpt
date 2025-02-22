import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/models/user/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 're_user_info.g.dart';

@JsonSerializable()
class ReUserInfo extends Object {
  @JsonKey(name: 'referenceUser')
  UserInfo? referenceUser;

  @JsonKey(name: 'user')
  UserInfo? user;

  @JsonKey(name: 'hashrate')
  PlanDetail? planDetail;

  @JsonKey(name: 'isValid', defaultValue: false)
  bool? isValid;

  @JsonKey(name: 'totalRent', defaultValue: 0)
  int? totalRent;

  @JsonKey(name: 'totalMember', defaultValue: 0)
  int? totalMember;

  @JsonKey(name: 'totalProfit', defaultValue: 0)
  int? totalProfit;

  @JsonKey(name: 'totalSubscription', defaultValue: 0)
  int? totalSubscription;

  @JsonKey(name: 'totalRevenue', defaultValue: 0)
  int? totalRevenue;

  ReUserInfo(this.referenceUser, this.user, this.planDetail, this.isValid, this.totalRent,
      this.totalMember, this.totalProfit, this.totalSubscription, this.totalRevenue);

  factory ReUserInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$ReUserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReUserInfoToJson(this);
}



