import 'package:json_annotation/json_annotation.dart';

part 'notice_info.g.dart';

@JsonSerializable()
class NoticeInfo extends Object {

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'content')
  String? content;

  @JsonKey(name: 'type')
  int? type;

  @JsonKey(name: 'publicTime')
  String? publicTime;

  NoticeInfo(this.title,this.content,this.type,this.publicTime,);

  factory NoticeInfo.fromJson(Map<String, dynamic> srcJson) => _$NoticeInfoFromJson(srcJson);

}


