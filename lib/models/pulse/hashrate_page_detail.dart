import 'package:freezed_annotation/freezed_annotation.dart';

part 'hashrate_page_detail.freezed.dart';
part 'hashrate_page_detail.g.dart';

@freezed
class HashratePageDetail with _$HashratePageDetail {
  factory HashratePageDetail({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'createTime') @Default('') String createTime,
    @JsonKey(name: 'updateTime') @Default('') String updateTime,
    @JsonKey(name: 'createUserId') @Default(0) int createUserId,
    @JsonKey(name: 'createUserName') @Default('') String createUserName,
    @JsonKey(name: 'updateUserId') @Default(0) int updateUserId,
    @JsonKey(name: 'updateUserName') @Default('') String updateUserName,
    @JsonKey(name: 'isDelete') @Default(false) bool isDelete,
    @JsonKey(name: 'sysExtInfo') @Default('') String sysExtInfo,
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'orderNo') @Default(0) int orderNo,
    @JsonKey(name: 'condition') @Default('') String condition,
    @JsonKey(name: 'firstLayer') @Default(0) int firstLayer,
    @JsonKey(name: 'secondLayer') @Default(0) int secondLayer,
    @JsonKey(name: 'thirdLayer') @Default(0) int thirdLayer,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'enable') @Default(0) int enable,
    @JsonKey(name: 'remark') @Default('') String remark,
  }) = _HashratePageDetail;

  factory HashratePageDetail.fromJson(Map<String, dynamic> json) =>
      _$HashratePageDetailFromJson(json);
}
