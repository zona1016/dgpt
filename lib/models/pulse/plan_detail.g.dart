// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlanDetailImpl _$$PlanDetailImplFromJson(Map<String, dynamic> json) =>
    _$PlanDetailImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      profitPreHour: (json['profitPreHour'] as num?)?.toDouble() ?? 0,
      profitPreDay: (json['profitPreDay'] as num?)?.toDouble() ?? 0,
      profitTotal: (json['profitTotal'] as num?)?.toDouble() ?? 0,
      profitRate: (json['profitRate'] as num?)?.toDouble() ?? 0,
      cycle: (json['cycle'] as num?)?.toDouble() ?? 0,
      purchaseLimitType: (json['purchaseLimitType'] as num?)?.toDouble() ?? 0,
      purchaseLimitQuantity:
          (json['purchaseLimitQuantity'] as num?)?.toDouble() ?? 0,
      description: json['description'] as String? ?? '',
      remark: json['remark'] as String? ?? '',
      enable: (json['enable'] as num?)?.toDouble() ?? 0,
      logoFileId: (json['logoFileId'] as num?)?.toDouble() ?? 0,
      logoFileIdUrl: json['logoFileIdUrl'] as String? ?? '',
      logoDynamicFileIdUrl: json['logoDynamicFileIdUrl'] as String? ?? '',
      speedLevel: (json['speedLevel'] as num?)?.toDouble() ?? 0,
      pcieName: json['pcieName'] as String? ?? '',
      upSpeed: (json['upSpeed'] as num?)?.toDouble() ?? 0,
      downSpeed: (json['downSpeed'] as num?)?.toDouble() ?? 0,
      ports: (json['ports'] as num?)?.toDouble() ?? 0,
      ops: (json['ops'] as num?)?.toDouble() ?? 0,
      maxCuda: (json['maxCuda'] as num?)?.toDouble() ?? 0,
      ram: (json['ram'] as num?)?.toDouble() ?? 0,
      speed: (json['speed'] as num?)?.toDouble() ?? 0,
      graphicsIconFileId: (json['graphicsIconFileId'] as num?)?.toDouble() ?? 0,
      graphicsIconFileIdUrl: json['graphicsIconFileIdUrl'] as String? ?? '',
      graphicsName: json['graphicsName'] as String? ?? '',
      graphicsCpu: json['graphicsCpu'] as String? ?? '',
      graphicsRam: json['graphicsRam'] as String? ?? '',
      virtualName: json['virtualName'] as String? ?? '',
      virtualDesc: json['virtualDesc'] as String? ?? '',
      servicesName: json['servicesName'] as String? ?? '',
      servicesDesc: json['servicesDesc'] as String? ?? '',
      isBuy: json['isBuy'] as bool? ?? false,
      buyStatus: (json['buyStatus'] as num?)?.toInt() ?? 0,
      planId: (json['planId'] as num?)?.toInt() ?? 0,
      status: (json['status'] as num?)?.toInt() ?? 0,
      beginDate: json['beginDate'] as String? ?? '',
      logicEndDate: json['logicEndDate'] as String? ?? '',
      endTimeDate: json['endTimeDate'] as String? ?? '',
      sysNowTime: json['sysNowTime'] as String? ?? '',
      roiTotal: (json['roiTotal'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$PlanDetailImplToJson(_$PlanDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'amount': instance.amount,
      'profitPreHour': instance.profitPreHour,
      'profitPreDay': instance.profitPreDay,
      'profitTotal': instance.profitTotal,
      'profitRate': instance.profitRate,
      'cycle': instance.cycle,
      'purchaseLimitType': instance.purchaseLimitType,
      'purchaseLimitQuantity': instance.purchaseLimitQuantity,
      'description': instance.description,
      'remark': instance.remark,
      'enable': instance.enable,
      'logoFileId': instance.logoFileId,
      'logoFileIdUrl': instance.logoFileIdUrl,
      'logoDynamicFileIdUrl': instance.logoDynamicFileIdUrl,
      'speedLevel': instance.speedLevel,
      'pcieName': instance.pcieName,
      'upSpeed': instance.upSpeed,
      'downSpeed': instance.downSpeed,
      'ports': instance.ports,
      'ops': instance.ops,
      'maxCuda': instance.maxCuda,
      'ram': instance.ram,
      'speed': instance.speed,
      'graphicsIconFileId': instance.graphicsIconFileId,
      'graphicsIconFileIdUrl': instance.graphicsIconFileIdUrl,
      'graphicsName': instance.graphicsName,
      'graphicsCpu': instance.graphicsCpu,
      'graphicsRam': instance.graphicsRam,
      'virtualName': instance.virtualName,
      'virtualDesc': instance.virtualDesc,
      'servicesName': instance.servicesName,
      'servicesDesc': instance.servicesDesc,
      'isBuy': instance.isBuy,
      'buyStatus': instance.buyStatus,
      'planId': instance.planId,
      'status': instance.status,
      'beginDate': instance.beginDate,
      'logicEndDate': instance.logicEndDate,
      'endTimeDate': instance.endTimeDate,
      'sysNowTime': instance.sysNowTime,
      'roiTotal': instance.roiTotal,
    };
