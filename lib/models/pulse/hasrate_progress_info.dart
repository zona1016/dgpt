import 'package:freezed_annotation/freezed_annotation.dart';

part 'hasrate_progress_info.freezed.dart';
part 'hasrate_progress_info.g.dart';

@freezed
class HasrateProgressInfo with _$HasrateProgressInfo {
  factory HasrateProgressInfo({
    @JsonKey(name: 'next') Next? next,
    @JsonKey(name: 'planAmount') @Default(0.0) double planAmount,
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
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'condition') @Default('') String condition,
    @JsonKey(name: 'firstLayer') @Default(0) int firstLayer,
    @JsonKey(name: 'secondLayer') @Default(0) int secondLayer,
    @JsonKey(name: 'thirdLayer') @Default(0) int thirdLayer,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'conditionDto') ConditionDto? conditionDto,
  }) = _Next;

  factory Next.fromJson(Map<String, dynamic> json) => _$NextFromJson(json);
}

@freezed
class ConditionDto with _$ConditionDto {
  factory ConditionDto({
    @JsonKey(name: 'minPlanAmount') @Default(0.0) double minPlanAmount,
    @JsonKey(name: 'directCount') @Default(0) int directCount,
    @JsonKey(name: 'teamCount') @Default(0) int teamCount,
  }) = _ConditionDto;

  factory ConditionDto.fromJson(Map<String, dynamic> json) =>
      _$ConditionDtoFromJson(json);
}
