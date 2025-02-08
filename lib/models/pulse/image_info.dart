import 'package:json_annotation/json_annotation.dart';

part 'image_info.g.dart';

@JsonSerializable()
class ImageInfo extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'url')
  String url;

  ImageInfo(this.id,this.url,);

  factory ImageInfo.fromJson(Map<String, dynamic> srcJson) => _$ImageInfoFromJson(srcJson);

}


