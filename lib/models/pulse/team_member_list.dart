import 'package:json_annotation/json_annotation.dart';

part 'team_member_list.g.dart';

@JsonSerializable()
class TeamMemberList extends Object {

  @JsonKey(name: 'account')
  String? account;

  @JsonKey(name: 'realName')
  String? realName;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'hashrateCode')
  String? hashrateCode;

  @JsonKey(name: 'hashrateName')
  String? hashrateName;

  TeamMemberList(this.account,this.realName,this.email,this.hashrateCode,this.hashrateName,);

  factory TeamMemberList.fromJson(Map<String, dynamic> srcJson) => _$TeamMemberListFromJson(srcJson);

}

