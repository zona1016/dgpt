// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_message_received_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebMessageReceivedInfo _$WebMessageReceivedInfoFromJson(
        Map<String, dynamic> json) =>
    WebMessageReceivedInfo(
      json['type'] as String,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WebMessageReceivedInfoToJson(
        WebMessageReceivedInfo instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['type'] as String,
      json['base64'] as String?,
      json['token'] as String?,
      json['chatUserId'] as String?,
      json['chatUserSig'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'type': instance.type,
      'base64': instance.base64,
      'token': instance.token,
      'chatUserId': instance.chatUserId,
      'chatUserSig': instance.chatUserSig,
    };
