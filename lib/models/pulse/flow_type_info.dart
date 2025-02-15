import 'package:json_annotation/json_annotation.dart';

part 'flow_type_info.g.dart';

@JsonSerializable()
class FlowTypeInfo extends Object {

  @JsonKey(name: 'text')
  String text;

  @JsonKey(name: 'value')
  int value;

  FlowTypeInfo(this.text,this.value,);

  factory FlowTypeInfo.fromJson(Map<String, dynamic> srcJson) => _$FlowTypeInfoFromJson(srcJson);

}


