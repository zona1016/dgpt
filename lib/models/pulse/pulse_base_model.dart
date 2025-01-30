import 'package:json_annotation/json_annotation.dart';

part 'pulse_base_model.g.dart';

@JsonSerializable()
class BaseModel {
  @JsonKey(name: 'id', defaultValue: 0)
  int? id;

  @JsonKey(name: 'createTime', defaultValue: '')
  String? createTime;

  @JsonKey(name: 'updateTime', defaultValue: '')
  String? updateTime;

  @JsonKey(name: 'createUserId', defaultValue: 0)
  int? createUserId;

  @JsonKey(name: 'createUserName', defaultValue: '')
  String? createUserName;

  @JsonKey(name: 'updateUserId', defaultValue: 0)
  int? updateUserId;

  @JsonKey(name: 'updateUserName', defaultValue: '')
  String? updateUserName;

  @JsonKey(name: 'isDelete', defaultValue: false)
  bool? isDelete;

  @JsonKey(name: 'sysExtInfo', defaultValue: '')
  String? sysExtInfo;

  @JsonKey(name: 'description', defaultValue: 'string')
  String? description;

  @JsonKey(name: 'enable', defaultValue: 0)
  int? enable;

  @JsonKey(name: 'remark', defaultValue: 'string')
  String? remark;

  BaseModel({
    this.id,
    this.createTime,
    this.updateTime,
    this.createUserId,
    this.createUserName,
    this.updateUserId,
    this.updateUserName,
    this.isDelete,
    this.sysExtInfo,
    this.description,
    this.enable,
    this.remark,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
