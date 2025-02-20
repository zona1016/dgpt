import 'package:dgpt/models/pulse/direct_top_info.dart';
import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/models/user/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'layer_hashrate_info.g.dart';

@JsonSerializable()
class LayerHashrateInfo extends Object {

  @JsonKey(name: 'hashrate')
  PowerInfo? hashrate;

  @JsonKey(name: 'count', defaultValue: 0)
  int? count;

  @JsonKey(name: 'memberList', defaultValue: [])
  List<MemberList>? memberList;

  LayerHashrateInfo(this.hashrate,this.count,this.memberList,);

  factory LayerHashrateInfo.fromJson(Map<String, dynamic> srcJson) => _$LayerHashrateInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LayerHashrateInfoToJson(this);

}

@JsonSerializable()
class MemberList extends Object {

  @JsonKey(name: 'powerInfo')
  PowerInfo? powerInfo;

  @JsonKey(name: 'user')
  UserInfo? user;

  @JsonKey(name: 'planValid', defaultValue: false)
  bool? planValid;

  @JsonKey(name: 'teamUserCount', defaultValue: 0)
  int? teamUserCount;

  MemberList(this.powerInfo,this.user,this.planValid,this.teamUserCount,);

  factory MemberList.fromJson(Map<String, dynamic> srcJson) => _$MemberListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MemberListToJson(this);

}



