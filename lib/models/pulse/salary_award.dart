import 'package:json_annotation/json_annotation.dart';

part 'salary_award.g.dart';


@JsonSerializable()
class SalaryAward extends Object {

  @JsonKey(name: 'id', defaultValue: 0)
  int? id;

  @JsonKey(name: 'planAmountTotal', defaultValue: 0)
  double? planAmountTotal;

  @JsonKey(name: 'monthPlanAmount', defaultValue: 0)
  double? monthPlanAmount;

  @JsonKey(name: 'jobTitleSnapshot', defaultValue: '')
  String? jobTitleSnapshot;

  @JsonKey(name: 'calculateDate', defaultValue: '')
  String? calculateDate;

  @JsonKey(name: 'amount', defaultValue: 0)
  double? amount;

  SalaryAward(this.id,this.planAmountTotal,this.monthPlanAmount,this.jobTitleSnapshot,this.calculateDate,this.amount,);

  factory SalaryAward.fromJson(Map<String, dynamic> srcJson) => _$SalaryAwardFromJson(srcJson);

}


