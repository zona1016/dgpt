import 'package:json_annotation/json_annotation.dart';
import 'pulse_base_model.dart';

part 'kyc.g.dart';

@JsonSerializable()
class Kyc extends BaseModel {
  @JsonKey(name: 'userId', defaultValue: 0)
  int? userId;

  @JsonKey(name: 'userFkDisplayName', defaultValue: '')
  String? userFkDisplayName;

  @JsonKey(name: 'realName', defaultValue: '')
  String? realName;

  @JsonKey(name: 'idType', defaultValue: 0)
  int? idType;

  @JsonKey(name: 'idValue', defaultValue: '')
  String? idValue;

  @JsonKey(name: 'imageFileId', defaultValue: 0)
  int? imageFileId;

  @JsonKey(name: 'status', defaultValue: 0)
  int? status;

  @JsonKey(name: 'auditDate', defaultValue: '')
  String? auditDate;

  @JsonKey(name: 'auditResult', defaultValue: '')
  String? auditResult;

  Kyc({
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
    this.realName,
    this.idType,
    this.idValue,
    this.imageFileId,
    this.status,
    this.auditDate,
    this.auditResult,
  });

  factory Kyc.fromJson(Map<String, dynamic> json) => _$KycFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$KycToJson(this);
}
