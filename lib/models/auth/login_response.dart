import 'package:aida/models/user/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Object {

  @JsonKey(name: 'userinfo')
  UserInfo userInfo;

  LoginResponse(this.userInfo,);

  factory LoginResponse.fromJson(Map<String, dynamic> srcJson) => _$LoginResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}