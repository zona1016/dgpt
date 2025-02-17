import 'package:json_annotation/json_annotation.dart';

part 'user_team_total_info.g.dart';

@JsonSerializable()
class UserTeamTotalInfo extends Object {

  @JsonKey(name: 'memberCount', defaultValue: 0)
  int? memberCount;

  @JsonKey(name: 'realMemberCount', defaultValue: 0)
  int? realMemberCount;

  UserTeamTotalInfo(this.memberCount,this.realMemberCount,);

  factory UserTeamTotalInfo.fromJson(Map<String, dynamic> srcJson) => _$UserTeamTotalInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserTeamTotalInfoToJson(this);

}


