import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  @JsonKey(name: "id", defaultValue: 0)
  final int? id;
  @JsonKey(name: "account", defaultValue: '')
  final String? account;
  @JsonKey(name: "realName", defaultValue: '')
  final String? realName;
  @JsonKey(name: "phone", defaultValue: '')
  final String? phone;
  @JsonKey(name: "idCardNum", defaultValue: '')
  final String? idCardNum;
  @JsonKey(name: "inviteCode", defaultValue: '')
  final String? inviteCode;
  @JsonKey(name: "email", defaultValue: '')
  final String? email;
  @JsonKey(name: "accountType", defaultValue: 0)
  final int? accountType;
  @JsonKey(name: "avatar", defaultValue: '')
  final String? avatar;
  @JsonKey(name: "introduction", defaultValue: 0)
  final int? introduction;
  @JsonKey(name: "address", defaultValue: 0)
  final int? address;
  @JsonKey(name: "signature", defaultValue: 0)
  final int? signature;
  @JsonKey(name: "orgId", defaultValue: 0)
  final int? orgId;
  @JsonKey(name: "orgName", defaultValue: '')
  final String? orgName;
  @JsonKey(name: "orgType", defaultValue: '')
  final String? orgType;
  @JsonKey(name: "posName", defaultValue: '')
  final String? posName;
  @JsonKey(name: "buttons", defaultValue: [])
  final List<String>? buttons;
  @JsonKey(name: "watermarkText", defaultValue: '')
  final String? watermarkText;
  @JsonKey(name: "phoneNation", defaultValue: 0)
  final int? phoneNation;
  @JsonKey(name: "tenantId", defaultValue: 0)
  final int? tenantId;
  @JsonKey(name: "roleIds", defaultValue: [])
  final List<int>? roleIds;
  @JsonKey(name: "hasBind", defaultValue: false)
  bool? hasBind;
  @JsonKey(name: "lastLogin", defaultValue: '')
  final String? lastLogin;
  @JsonKey(name: "beginDate", defaultValue: '')
  final String? beginDate;
  @JsonKey(name: "logicEndDate", defaultValue: '')
  final String? logicEndDate;
  @JsonKey(name: "endTimeDate", defaultValue: '')
  final String? endTimeDate;
  @JsonKey(name: "sysNowTime", defaultValue: '')
  final String? sysNowTime;
  @JsonKey(name: "createTime", defaultValue: '')
  final String? createTime;
  @JsonKey(name: "layer", defaultValue: 0)
  final int? layer;

  UserInfo({
    this.id,
    this.account,
    this.realName,
    this.phone,
    this.idCardNum,
    this.email,
    this.accountType,
    this.avatar,
    this.introduction,
    this.address,
    this.signature,
    this.orgId,
    this.orgName,
    this.orgType,
    this.posName,
    this.buttons,
    this.watermarkText,
    this.tenantId,
    this.roleIds,
    this.phoneNation,
    this.inviteCode,
    this.hasBind,
    this.lastLogin,
    this.beginDate,
    this.logicEndDate,
    this.endTimeDate,
    this.sysNowTime,
    this.createTime,
    this.layer
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return _$UserInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserInfoToJson(this);
  }
}


