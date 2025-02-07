import 'package:json_annotation/json_annotation.dart';

part 'team_hashrate_count_total.g.dart';

@JsonSerializable()
class TeamHashrateCountTotal extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'count')
  int count;

  TeamHashrateCountTotal(this.code,this.name,this.count,);

  factory TeamHashrateCountTotal.fromJson(Map<String, dynamic> srcJson) => _$TeamHashrateCountTotalFromJson(srcJson);

}


