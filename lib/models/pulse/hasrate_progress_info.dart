import 'package:freezed_annotation/freezed_annotation.dart';

part 'hasrate_progress_info.freezed.dart';
part 'hasrate_progress_info.g.dart';

@freezed
class HasrateProgressInfo with _$HasrateProgressInfo {
  factory HasrateProgressInfo({
    @JsonKey(name: 'next') Next? next,
    @JsonKey(name: 'planAmount') @Default(0) int planAmount,
    @JsonKey(name: 'directCount') @Default(0) int directCount,
    @JsonKey(name: 'teamCount') @Default(0) int teamCount,
  }) = _HasrateProgressInfo;

  factory HasrateProgressInfo.fromJson(Map<String, dynamic> json) =>
      _$HasrateProgressInfoFromJson(json);
}

@freezed
class Next with _$Next {
  factory Next({
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
    @JsonKey(name: 'orderNo') @Default(0) int orderNo,
    @JsonKey(name: 'condition') @Default('') String condition,
    @JsonKey(name: 'firstLayer') @Default(0) int firstLayer,
    @JsonKey(name: 'secondLayer') @Default(0) int secondLayer,
    @JsonKey(name: 'thirdLayer') @Default(0) int thirdLayer,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'enable') @Default(0) int enable,
    @JsonKey(name: 'remark') @Default('') String remark,
  }) = _Next;

  factory Next.fromJson(Map<String, dynamic> json) => _$NextFromJson(json);
}
