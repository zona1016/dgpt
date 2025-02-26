import 'package:json_annotation/json_annotation.dart';
import 'pulse_base_model.dart';

part 'flow_info.g.dart';

@JsonSerializable()
class FlowInfo extends BaseModel {
  @JsonKey(name: 'userId', defaultValue: 0)
  int? userId;

  @JsonKey(name: 'userFkDisplayName', defaultValue: '')
  String? userFkDisplayName;

  @JsonKey(name: 'type', defaultValue: 0)
  int? type;

  @JsonKey(name: 'fromAccount', defaultValue: 0)
  int? fromAccount;

  @JsonKey(name: 'toAccount', defaultValue: 0)
  int? toAccount;

  // 0：待审核，1：同意，2：拒绝
  @JsonKey(name: 'status', defaultValue: 0)
  int? status;

  @JsonKey(name: 'balance', defaultValue: 0)
  double? balance;

  @JsonKey(name: 'amount', defaultValue: 0)
  double? amount;

  @JsonKey(name: 'targetAccount', defaultValue: '')
  String? targetAccount;

  FlowInfo({
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
    this.userId,
    this.userFkDisplayName,
    this.type,
    this.fromAccount,
    this.toAccount,
    this.balance,
    this.amount,
    this.targetAccount
  });

  factory FlowInfo.fromJson(Map<String, dynamic> json) => _$FlowInfoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FlowInfoToJson(this);
}
