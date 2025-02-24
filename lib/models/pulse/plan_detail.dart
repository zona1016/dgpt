import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_detail.freezed.dart';
part 'plan_detail.g.dart';

@freezed
class PlanDetail with _$PlanDetail {
  factory PlanDetail({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'amount') @Default(0) double amount,
    @JsonKey(name: 'profitPreHour') @Default(0) double profitPreHour,
    @JsonKey(name: 'profitPreDay') @Default(0) double profitPreDay,
    @JsonKey(name: 'profitTotal') @Default(0) double profitTotal,
    @JsonKey(name: 'profitRate') @Default(0) double profitRate,
    @JsonKey(name: 'cycle') @Default(0) double cycle,
    @JsonKey(name: 'purchaseLimitType') @Default(0) double purchaseLimitType,
    @JsonKey(name: 'purchaseLimitQuantity') @Default(0) double purchaseLimitQuantity,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'remark') @Default('') String remark,
    @JsonKey(name: 'enable') @Default(0) double enable,
    @JsonKey(name: 'logoFileId') @Default(0) double logoFileId,
    @JsonKey(name: 'logoFileIdUrl') @Default('') String logoFileIdUrl,
    @JsonKey(name: 'logoDynamicFileIdUrl') @Default('') String logoDynamicFileIdUrl,
    @JsonKey(name: 'speedLevel') @Default(0) double speedLevel,
    @JsonKey(name: 'pcieName') @Default('') String pcieName,
    @JsonKey(name: 'upSpeed') @Default(0) double upSpeed,
    @JsonKey(name: 'downSpeed') @Default(0) double downSpeed,
    @JsonKey(name: 'ports') @Default(0) double ports,
    @JsonKey(name: 'ops') @Default(0) double ops,
    @JsonKey(name: 'maxCuda') @Default(0) double maxCuda,
    @JsonKey(name: 'ram') @Default(0) double ram,
    @JsonKey(name: 'speed') @Default(0) double speed,
    @JsonKey(name: 'graphicsIconFileId') @Default(0) double graphicsIconFileId,
    @JsonKey(name: 'graphicsIconFileIdUrl') @Default('') String graphicsIconFileIdUrl,
    @JsonKey(name: 'graphicsName') @Default('') String graphicsName,
    @JsonKey(name: 'graphicsCpu') @Default('') String graphicsCpu,
    @JsonKey(name: 'graphicsRam') @Default('') String graphicsRam,
    @JsonKey(name: 'virtualName') @Default('') String virtualName,
    @JsonKey(name: 'virtualDesc') @Default('') String virtualDesc,
    @JsonKey(name: 'servicesName') @Default('') String servicesName,
    @JsonKey(name: 'servicesDesc') @Default('') String servicesDesc,
    @JsonKey(name: 'isBuy') @Default(false) bool isBuy,
    @JsonKey(name: 'buyStatus') @Default(0) int buyStatus,
    @JsonKey(name: 'planId') @Default(0) int planId,
    @JsonKey(name: 'status') @Default(0) int status,
    @JsonKey(name: 'createTime') @Default('') String createTime,
    @JsonKey(name: 'beginDate') @Default('') String beginDate,
    @JsonKey(name: 'logicEndDate') @Default('') String logicEndDate,
    @JsonKey(name: 'endTimeDate') @Default('') String endTimeDate,
    @JsonKey(name: 'sysNowTime') @Default('') String sysNowTime,
    @JsonKey(name: 'roiTotal') @Default(0) double roiTotal,

  }) = _PlanDetail;

  factory PlanDetail.fromJson(Map<String, dynamic> json) =>
      _$PlanDetailFromJson(json);
}
