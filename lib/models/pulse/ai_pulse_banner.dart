import 'package:json_annotation/json_annotation.dart';
import 'pulse_base_model.dart';

part 'ai_pulse_banner.g.dart';

@JsonSerializable()
class Banner extends BaseModel {
  @JsonKey(name: 'sort', defaultValue: 0)
  int? sort;

  @JsonKey(name: 'title', defaultValue: '')
  String? title;

  @JsonKey(name: 'imagePath', defaultValue: '')
  String? imagePath;

  @JsonKey(name: 'position', defaultValue: 0)
  int? position;

  Banner({
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
    this.sort,
    this.title,
  });

  factory Banner.fromJson(Map<String, dynamic> json) =>
      _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
