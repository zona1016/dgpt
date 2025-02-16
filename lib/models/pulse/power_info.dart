import 'package:freezed_annotation/freezed_annotation.dart';

part 'power_info.freezed.dart';
part 'power_info.g.dart';

@freezed
class PowerInfo with _$PowerInfo {
  factory PowerInfo({
    @JsonKey(name: 'createDate') @Default('') String createDate,
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'firstLayer') @Default(0.0) double firstLayer,
    @JsonKey(name: 'secondLayer') @Default(0.0) double secondLayer,
    @JsonKey(name: 'thirdLayer') @Default(0.0) double thirdLayer,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'orderNo') @Default(0) int orderNo,
    @JsonKey(name: 'enable') @Default(0) int enable,
    @JsonKey(name: 'createTime') @Default('') String createTime,
  }) = _PowerInfo;

  factory PowerInfo.fromJson(Map<String, dynamic> json) =>
      _$PowerInfoFromJson(json);
}
