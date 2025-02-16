import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/models/user/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'direct_top_info.g.dart';


@JsonSerializable()
class DirectTopInfo extends Object {

  @JsonKey(name: 'user')
  UserInfo? user;

  @JsonKey(name: 'hashrate')
  PowerInfo? hashrate;

  @JsonKey(name: 'teamCount', defaultValue: 0)
  int? teamCount;

  @JsonKey(name: 'directCount', defaultValue: 0)
  int? directCount;

  DirectTopInfo(this.user,this.hashrate,this.teamCount,this.directCount,);

  factory DirectTopInfo.fromJson(Map<String, dynamic> srcJson) => _$DirectTopInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DirectTopInfoToJson(this);

}

@JsonSerializable()
class SysOrg extends Object {

  @JsonKey(name: 'id', defaultValue: 0)
  int? id;

  @JsonKey(name: 'createTime', defaultValue: '')
  String? createTime;

  @JsonKey(name: 'updateTime', defaultValue: '')
  String? updateTime;

  @JsonKey(name: 'createUserId', defaultValue: 0)
  int? createUserId;

  @JsonKey(name: 'createUserName', defaultValue: '')
  String? createUserName;

  @JsonKey(name: 'updateUserId', defaultValue: 0)
  int? updateUserId;

  @JsonKey(name: 'updateUserName', defaultValue: '')
  String? updateUserName;

  @JsonKey(name: 'isDelete', defaultValue: false)
  bool? isDelete;

  @JsonKey(name: 'tenantId', defaultValue: 0)
  int? tenantId;

  @JsonKey(name: 'pid', defaultValue: 0)
  int? pid;

  @JsonKey(name: 'name', defaultValue: '')
  String? name;

  @JsonKey(name: 'code', defaultValue: '')
  String? code;

  @JsonKey(name: 'level', defaultValue: 0)
  int? level;

  @JsonKey(name: 'type', defaultValue: '')
  String? type;

  @JsonKey(name: 'directorId', defaultValue: 0)
  int? directorId;

  @JsonKey(name: 'orderNo', defaultValue: 0)
  int? orderNo;

  @JsonKey(name: 'status', defaultValue: 0)
  int? status;

  @JsonKey(name: 'remark', defaultValue: '')
  String? remark;

  @JsonKey(name: 'children', defaultValue: [])
  List<String>? children;

  @JsonKey(name: 'disabled', defaultValue: false)
  bool? disabled;

  SysOrg(this.id,this.createTime,this.updateTime,this.createUserId,this.createUserName,this.updateUserId,this.updateUserName,this.isDelete,this.tenantId,this.pid,this.name,this.code,this.level,this.type,this.directorId,this.orderNo,this.status,this.remark,this.children,this.disabled,);

  factory SysOrg.fromJson(Map<String, dynamic> srcJson) => _$SysOrgFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SysOrgToJson(this);

}



