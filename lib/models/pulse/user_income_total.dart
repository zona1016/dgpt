import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_income_total.freezed.dart';
part 'user_income_total.g.dart';

@freezed
class UserIncomeTotal with _$UserIncomeTotal {
  factory UserIncomeTotal({
    @JsonKey(name: 'today') @Default(0) int today,
    @JsonKey(name: 'total') @Default(0) int total,
  }) = _UserIncomeTotal;

  factory UserIncomeTotal.fromJson(Map<String, dynamic> json) =>
      _$UserIncomeTotalFromJson(json);
}