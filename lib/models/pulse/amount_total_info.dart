import 'package:freezed_annotation/freezed_annotation.dart';

part 'amount_total_info.freezed.dart';
part 'amount_total_info.g.dart';

@freezed
class AmountTotalInfo with _$AmountTotalInfo {
  factory AmountTotalInfo({
    @JsonKey(name: 'planAmountTotal') @Default(0) double planAmountTotal,
    @JsonKey(name: 'directAwardAmountTotal') @Default(0) double directAwardAmountTotal,
    @JsonKey(name: 'teamAwardAmountTotal') @Default(0) double teamAwardAmountTotal,
    @JsonKey(name: 'roiAmountTotal') @Default(0) double roiAmountTotal,
  }) = _AmountTotalInfo;

  factory AmountTotalInfo.fromJson(Map<String, dynamic> json) =>
      _$AmountTotalInfoFromJson(json);
}