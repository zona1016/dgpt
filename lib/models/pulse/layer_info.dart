import 'package:json_annotation/json_annotation.dart';

part 'layer_info.g.dart';

@JsonSerializable()
class LayerInfo extends Object {

  @JsonKey(name: 'layer', defaultValue: -1)
  int? layer;

  @JsonKey(name: 'userCount', defaultValue: 0)
  int? userCount;

  @JsonKey(name: 'realUserCount', defaultValue: 0)
  int? realUserCount;

  @JsonKey(name: 'todyRoiTotal', defaultValue: 0)
  double todyRoiTotal;

  @JsonKey(name: 'roiTotal', defaultValue: 0)
  double roiTotal;

  LayerInfo(this.layer,this.userCount,this.realUserCount,this.todyRoiTotal,this.roiTotal,);

  factory LayerInfo.fromJson(Map<String, dynamic> srcJson) => _$LayerInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LayerInfoToJson(this);

}


