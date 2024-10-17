import 'package:json_annotation/json_annotation.dart';

part 'image_uploader_info.g.dart';


@JsonSerializable()
class ImageUploaderInfo extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'time')
  String time;

  @JsonKey(name: 'data')
  Data data;

  ImageUploaderInfo(this.code,this.msg,this.time,this.data,);

  factory ImageUploaderInfo.fromJson(Map<String, dynamic> srcJson) => _$ImageUploaderInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ImageUploaderInfoToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'fullurl')
  String fullUrl;

  Data(this.url,this.fullUrl,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


