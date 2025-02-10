import 'package:json_annotation/json_annotation.dart';

part 'ai_chat_message.g.dart';

@JsonSerializable()
class AiChatMessage extends Object {

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'index')
  int? index;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'text')
  String? text;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'datetime')
  String? datetime;

  @JsonKey(defaultValue: false)
  bool? animal;

  get isSelf => type == 1;

  AiChatMessage(this.id,this.index,this.type,this.text,this.message,this.datetime,this.animal);

  factory AiChatMessage.fromJson(Map<String, dynamic> srcJson) => _$AiChatMessageFromJson(srcJson);

}