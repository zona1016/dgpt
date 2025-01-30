import 'package:json_annotation/json_annotation.dart';
import 'pulse_base_model.dart';

part 'hashrate.g.dart';

@JsonSerializable()
class Hashrate extends BaseModel {
  @JsonKey(name: 'code', defaultValue: '')
  String? code;

  @JsonKey(name: 'name', defaultValue: '')
  String? name;

  @JsonKey(name: 'orderNo', defaultValue: 0)
  int? orderNo;

  @JsonKey(name: 'condition', defaultValue: '')
  String? condition;

  @JsonKey(name: 'firstLayer', defaultValue: 0)
  int? firstLayer;

  @JsonKey(name: 'secondLayer', defaultValue: 0)
  int? secondLayer;

  @JsonKey(name: 'thirdLayer', defaultValue: 0)
  int? thirdLayer;

  Hashrate({
    super.id,
    super.createTime,
    super.updateTime,
    super.createUserId,
    super.createUserName,
    super.updateUserId,
    super.updateUserName,
    super.isDelete,
    super.sysExtInfo,
    super.description,
    super.enable,
    super.remark,
    this.code,
    this.name,
    this.orderNo,
    this.condition,
    this.firstLayer,
    this.secondLayer,
    this.thirdLayer,
  });

  factory Hashrate.fromJson(Map<String, dynamic> json) =>
      _$HashrateFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HashrateToJson(this);
}
