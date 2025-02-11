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
  @JsonKey(name: "nickName", defaultValue: '')
  final String? nickName;
  @JsonKey(name: "phoneNation", defaultValue: 0)
  final int? phoneNation;
  @JsonKey(name: "tenantId", defaultValue: 0)
  final int? tenantId;
  @JsonKey(name: "roleIds", defaultValue: [])
  final List<int>? roleIds;

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
    this.nickName,
    this.inviteCode
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return _$UserInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserInfoToJson(this);
  }
}


