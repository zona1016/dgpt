import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_balance.freezed.dart';
part 'user_balance.g.dart';

@freezed
class UserBalance with _$UserBalance {
  factory UserBalance({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'type') @Default(0) int type,
    @JsonKey(name: 'balance') @Default(0) double balance,
    @JsonKey(name: 'lockBalance') @Default(0) double lockBalance,
    @JsonKey(name: 'currency') @Default('') String currency,
  }) = _UserBalance;

  factory UserBalance.fromJson(Map<String, dynamic> json) =>
      _$UserBalanceFromJson(json);
}
