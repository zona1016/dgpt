import 'package:freezed_annotation/freezed_annotation.dart';

part 'hasrate_progress_info.freezed.dart';
part 'hasrate_progress_info.g.dart';

@freezed
class HasrateProgressInfo with _$HasrateProgressInfo {
  factory HasrateProgressInfo({
    @JsonKey(name: 'next') required Next next,
    @JsonKey(name: 'planAmount') required int planAmount,
    @JsonKey(name: 'directCount') required int directCount,
    @JsonKey(name: 'teamCount') required int teamCount,
  }) = _HasrateProgressInfo;

  factory HasrateProgressInfo.fromJson(Map<String, dynamic> json) =>
      _$HasrateProgressInfoFromJson(json);
}

@freezed
class Next with _$Next {
  factory Next({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'createTime') required String createTime,
    @JsonKey(name: 'updateTime') required String updateTime,
    @JsonKey(name: 'createUserId') required int createUserId,
    @JsonKey(name: 'createUserName') required String createUserName,
    @JsonKey(name: 'updateUserId') required int updateUserId,
    @JsonKey(name: 'updateUserName') required String updateUserName,
    @JsonKey(name: 'isDelete') required bool isDelete,
    @JsonKey(name: 'sysExtInfo') required String sysExtInfo,
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'orderNo') required int orderNo,
    @JsonKey(name: 'condition') required String condition,
    @JsonKey(name: 'firstLayer') required int firstLayer,
    @JsonKey(name: 'secondLayer') required int secondLayer,
    @JsonKey(name: 'thirdLayer') required int thirdLayer,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'enable') required int enable,
    @JsonKey(name: 'remark') required String remark,
  }) = _Next;

  factory Next.fromJson(Map<String, dynamic> json) => _$NextFromJson(json);
}
