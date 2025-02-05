import 'package:freezed_annotation/freezed_annotation.dart';

part 'hashrate_page_info.freezed.dart';
part 'hashrate_page_info.g.dart';

@freezed
class HasratePageInfo with _$HasratePageInfo {
  factory HasratePageInfo({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'amount') @Default(0) int amount,
    @JsonKey(name: 'profitPreHour') @Default(0) double profitPreHour,
    @JsonKey(name: 'profitPreDay') @Default(0) double profitPreDay,
    @JsonKey(name: 'profitTotal') @Default(0) double profitTotal,
    @JsonKey(name: 'profitRate') @Default(0) double profitRate,
    @JsonKey(name: 'cycle') @Default(0) int cycle,
    @JsonKey(name: 'purchaseLimitType') @Default(0) int purchaseLimitType,
    @JsonKey(name: 'purchaseLimitQuantity') @Default(0) int purchaseLimitQuantity,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'remark') @Default('') String remark,
    @JsonKey(name: 'enable') @Default(0) int enable,
  }) = _HasratePageInfo;

  factory HasratePageInfo.fromJson(Map<String, dynamic> json) =>
      _$HasratePageInfoFromJson(json);
}
