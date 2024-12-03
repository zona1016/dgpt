import 'package:json_annotation/json_annotation.dart';
part 'web_message_received_info.g.dart';

enum WebMessageReceivedInfoType {downLoadImg, qrScan, toMessage, changeLanguage, openOutLink}

@JsonSerializable()
class WebMessageReceivedInfo extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'data')
  Data data;

  WebMessageReceivedInfo(this.type,this.data);

  factory WebMessageReceivedInfo.fromJson(Map<String, dynamic> srcJson) => _$WebMessageReceivedInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WebMessageReceivedInfoToJson(this);
}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'base64')
  String? base64;

  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'chatUserId')
  String? chatUserId;

  @JsonKey(name: 'language')
  String? language;

  @JsonKey(name: 'chatUserSig')
  String? chatUserSig;

  @JsonKey(name: 'url')
  String? url;

  WebMessageReceivedInfoType? stringToEnum(String type) {
    switch (type) {
      case 'downLoadImg':
        return WebMessageReceivedInfoType.downLoadImg;
      case 'qrScan':
        return WebMessageReceivedInfoType.qrScan;
      case 'toMessage':
        return WebMessageReceivedInfoType.toMessage;
      case 'changeLanguage':
        return WebMessageReceivedInfoType.changeLanguage;
      case 'openOutLink':
        return WebMessageReceivedInfoType.openOutLink;
      default:
        return null; // Return null or handle the invalid case
    }
  }

  Data(this.type,this.base64,this.token,this.chatUserId, this.chatUserSig, this.url);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


