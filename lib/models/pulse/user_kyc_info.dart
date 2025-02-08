import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_kyc_info.freezed.dart';
part 'user_kyc_info.g.dart';

@freezed
class UserKYCInfo with _$UserKYCInfo {
  factory UserKYCInfo({
    @JsonKey(name: 'id') @Default(0) int id, // 默认值为 0
    @JsonKey(name: 'realName') @Default('') String realName, // 默认值为空字符串
    @JsonKey(name: 'idType') @Default(0) int idType, // 默认值为 0
    @JsonKey(name: 'idValue') @Default('') String idValue, // 默认值为空字符串
    @JsonKey(name: 'imageFileIdUrl') @Default('') String imageFileIdUrl, // 默认值为空字符串
    @JsonKey(name: 'imageFileId') @Default(0) int imageFileId, // 默认值为 0
    @JsonKey(name: 'status') @Default(0) int status, // 默认值为 0
    @JsonKey(name: 'auditDate') @Default('') String auditDate, // 默认值为空字符串
    @JsonKey(name: 'auditResult') @Default('') String auditResult, // 默认值为空字符串
    @JsonKey(name: 'country') @Default('') String country, // 默认值为空字符串
  }) = _UserKYCInfo;

  factory UserKYCInfo.fromJson(Map<String, dynamic> json) =>
      _$UserKYCInfoFromJson(json);
}
