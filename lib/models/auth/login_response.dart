import 'package:dgpt/models/user/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Object {

  @JsonKey(name: "accessToken", defaultValue: '')
  final String accessToken;
  @JsonKey(name: "refreshToken", defaultValue: '')
  final String refreshToken;

  LoginResponse(this.accessToken, this.refreshToken);

  factory LoginResponse.fromJson(Map<String, dynamic> srcJson) => _$LoginResponseFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

}