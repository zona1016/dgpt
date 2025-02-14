import 'package:json_annotation/json_annotation.dart';

part 'income_history.g.dart';

@JsonSerializable()
class IncomeHistory extends Object {

  @JsonKey(name: 'id', defaultValue: 0)
  int? id;

  @JsonKey(name: 'roiDate', defaultValue: '')
  String? roiDate;

  @JsonKey(name: 'amount', defaultValue: 0)
  double? amount;

  IncomeHistory(this.id,this.roiDate,this.amount,);

  factory IncomeHistory.fromJson(Map<String, dynamic> srcJson) => _$IncomeHistoryFromJson(srcJson);

}


