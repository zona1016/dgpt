import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  @JsonKey(name: "id", defaultValue: 0)
  final int? id;
  @JsonKey(name: "im_id", defaultValue: '')
  final String? imId;
  @JsonKey(name: "username", defaultValue: '')
  final String? username;
  @JsonKey(name: "nickname", defaultValue: '')
  final String? nickname;
  @JsonKey(name: "mobile", defaultValue: '')
  final String? mobile;
  @JsonKey(name: "avatar", defaultValue: '')
  final String? avatar;
  @JsonKey(name: "score", defaultValue: 0)
  final int? score;
  @JsonKey(name: "token", defaultValue: '')
  final String? token;
  @JsonKey(name: "user_id", defaultValue: 0)
  final int? userId;
  @JsonKey(name: "createtime", defaultValue: 0)
  final int? createTime;
  @JsonKey(name: "expiretime", defaultValue: 0)
  final int? expireTime;
  @JsonKey(name: "expires_in", defaultValue: 0)
  final int? expiresIn;
  @JsonKey(name: "email", defaultValue: '')
  final String? email;
  @JsonKey(name: "userSign", defaultValue: '')
  final String? userSign;

  UserInfo ({
    this.id,
    this.imId,
    this.username,
    this.nickname,
    this.mobile,
    this.avatar,
    this.score,
    this.token,
    this.userId,
    this.createTime,
    this.expireTime,
    this.expiresIn,
    this.email,
    this.userSign
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return _$UserInfoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserInfoToJson(this);
  }
}


