import 'package:json_annotation/json_annotation.dart';
import 'pulse_base_model.dart';

part 'deposit.g.dart';

@JsonSerializable()
class Deposit extends BaseModel {
  @JsonKey(name: 'userId', defaultValue: 0)
  int? userId;

  @JsonKey(name: 'merchantId', defaultValue: 0)
  int? merchantId;

  @JsonKey(name: 'merchantSnapshot', defaultValue: '')
  String? merchantSnapshot;

  @JsonKey(name: 'currency', defaultValue: '')
  String? currency;

  @JsonKey(name: 'address', defaultValue: '')
  String? address;

  @JsonKey(name: 'amount', defaultValue: 0)
  int? amount;

  @JsonKey(name: 'depositFileId', defaultValue: 0)
  int? depositFileId;

  @JsonKey(name: 'status', defaultValue: 0)
  int? status;

  @JsonKey(name: 'auditDate', defaultValue: '')
  String? auditDate;

  @JsonKey(name: 'auditResult', defaultValue: '')
  String? auditResult;

  Deposit({
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
    this.merchantId,
    this.merchantSnapshot,
    this.currency,
    this.address,
    this.amount,
    this.depositFileId,
    this.status,
    this.auditDate,
    this.auditResult,
  });

  factory Deposit.fromJson(Map<String, dynamic> json) =>
      _$DepositFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DepositToJson(this);
}
