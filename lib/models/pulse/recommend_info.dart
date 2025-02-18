import 'package:json_annotation/json_annotation.dart';

part 'recommend_info.g.dart';


@JsonSerializable()
class RecommendInfo extends Object {

  @JsonKey(name: 'account', defaultValue: '')
  String? account;

  @JsonKey(name: 'planAmount', defaultValue: 0)
  int? planAmount;

  @JsonKey(name: 'awardAmount', defaultValue: 0)
  double awardAmount;

  @JsonKey(name: 'createTime', defaultValue: '')
  String? createTime;

  RecommendInfo(this.account,this.planAmount,this.awardAmount,this.createTime,);

  factory RecommendInfo.fromJson(Map<String, dynamic> srcJson) => _$RecommendInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecommendInfoToJson(this);

}


