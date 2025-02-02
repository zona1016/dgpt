import 'package:freezed_annotation/freezed_annotation.dart';

part 'hashrate_page_info.freezed.dart';
part 'hashrate_page_info.g.dart';

@freezed
class HasratePageInfo with _$HasratePageInfo {
  factory HasratePageInfo({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'createTime') @Default('') String createTime,
    @JsonKey(name: 'updateTime') @Default('') String updateTime,
    @JsonKey(name: 'createUserId') @Default(0) int createUserId,
    @JsonKey(name: 'createUserName') @Default('') String createUserName,
    @JsonKey(name: 'updateUserId') @Default(0) int updateUserId,
    @JsonKey(name: 'updateUserName') @Default('') String updateUserName,
    @JsonKey(name: 'isDelete') @Default(false) bool isDelete,
    @JsonKey(name: 'sysExtInfo') @Default('') String sysExtInfo,
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'condition') @Default('') String condition,
    @JsonKey(name: 'firstLayer') @Default(0) int firstLayer,
    @JsonKey(name: 'secondLayer') @Default(0) int secondLayer,
    @JsonKey(name: 'thirdLayer') @Default(0) int thirdLayer,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'enable') @Default(0) int enable,
    @JsonKey(name: 'remark') @Default('') String remark,
  }) = _HasratePageInfo;

  factory HasratePageInfo.fromJson(Map<String, dynamic> json) =>
      _$HasratePageInfoFromJson(json);
}
