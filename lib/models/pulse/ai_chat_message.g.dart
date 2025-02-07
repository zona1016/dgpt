// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiChatMessage _$AiChatMessageFromJson(Map<String, dynamic> json) =>
    AiChatMessage(
      (json['id'] as num?)?.toInt(),
      (json['index'] as num?)?.toInt(),
      (json['type'] as num?)?.toInt(),
      json['text'] as String?,
      json['message'] as String?,
      json['datetime'] as String?,
    );

Map<String, dynamic> _$AiChatMessageToJson(AiChatMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'index': instance.index,
      'type': instance.type,
      'text': instance.text,
      'message': instance.message,
      'datetime': instance.datetime,
    };
