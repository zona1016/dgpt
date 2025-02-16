import 'package:freezed_annotation/freezed_annotation.dart';

part 'enable_job_info.freezed.dart';
part 'enable_job_info.g.dart';

@freezed
class EnableJobInfo with _$EnableJobInfo {
  factory EnableJobInfo({
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'orderNo') @Default(0) int orderNo,
    @JsonKey(name: 'condition') @Default('') String condition,
    @JsonKey(name: 'salary') @Default(0) double salary,
    @JsonKey(name: 'monthPlanAmount') @Default(0) double monthPlanAmount,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'enable') @Default(0) int enable,
    @JsonKey(name: 'conditionInfo') ConditionInfo? conditionInfo,
    @JsonKey(name: 'createTime') @Default('') String createTime,
    @JsonKey(name: 'isDelete') @Default(false) bool isDelete,
    @JsonKey(name: 'id') @Default(0) int id,
  }) = _EnableJobInfo;

  factory EnableJobInfo.fromJson(Map<String, dynamic> json) =>
      _$EnableJobInfoFromJson(json);
}

@freezed
class ConditionInfo with _$ConditionInfo {
  factory ConditionInfo({
    @JsonKey(name: 'hashrateCode') @Default('') String hashrateCode,
    @JsonKey(name: 'directHashrateCode') @Default('') String directHashrateCode,
    @JsonKey(name: 'directHashrateCount') @Default(0) int directHashrateCount,
    @JsonKey(name: 'directJobTitleCode') @Default('') String directJobTitleCode,
    @JsonKey(name: 'directJobTitleCount') @Default(0) int directJobTitleCount,
    @JsonKey(name: 'teamPlanAmountTotal') @Default(0) int teamPlanAmountTotal,
  }) = _ConditionInfo;

  factory ConditionInfo.fromJson(Map<String, dynamic> json) =>
      _$ConditionInfoFromJson(json);
}
