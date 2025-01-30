import 'package:json_annotation/json_annotation.dart';

part 'user_income_total.g.dart';

@JsonSerializable()
class UserIncomeTotal extends Object {

  @JsonKey(name: 'today', defaultValue: 0)
  int? today;

  @JsonKey(name: 'total', defaultValue: 0)
  int? total;

  UserIncomeTotal(this.today,this.total,);

  factory UserIncomeTotal.fromJson(Map<String, dynamic> srcJson) => _$UserIncomeTotalFromJson(srcJson);

}


