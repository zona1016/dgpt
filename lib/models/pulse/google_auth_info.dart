import 'package:json_annotation/json_annotation.dart';

part 'google_auth_info.g.dart';


@JsonSerializable()
class GoogleAuthInfo extends Object {

  @JsonKey(name: 'name', defaultValue: '')
  String? name;

  @JsonKey(name: 'secret', defaultValue: '')
  String? secret;

  @JsonKey(name: 'isSuer',defaultValue: '')
  String? isSuer;

  GoogleAuthInfo(this.name,this.secret,this.isSuer,);

  factory GoogleAuthInfo.fromJson(Map<String, dynamic> srcJson) => _$GoogleAuthInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoogleAuthInfoToJson(this);

}


