import 'package:json_annotation/json_annotation.dart';

part 'recommend_award_total_info.g.dart';


@JsonSerializable()
class RecommendAwardTotalInfo extends Object {

  @JsonKey(name: 'amountTotal', defaultValue: 0)
  double? amountTotal;

  @JsonKey(name: 'memberCount', defaultValue: 0)
  int? memberCount;

  RecommendAwardTotalInfo(this.amountTotal,this.memberCount,);

  factory RecommendAwardTotalInfo.fromJson(Map<String, dynamic> srcJson) => _$RecommendAwardTotalInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecommendAwardTotalInfoToJson(this);

}


