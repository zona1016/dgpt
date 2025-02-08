// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hasrate_progress_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HasrateProgressInfoImpl _$$HasrateProgressInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$HasrateProgressInfoImpl(
      next: json['next'] == null
          ? null
          : Next.fromJson(json['next'] as Map<String, dynamic>),
      planAmount: (json['planAmount'] as num?)?.toDouble() ?? 0.0,
      directCount: (json['directCount'] as num?)?.toInt() ?? 0,
      teamCount: (json['teamCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$HasrateProgressInfoImplToJson(
        _$HasrateProgressInfoImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
      'planAmount': instance.planAmount,
      'directCount': instance.directCount,
      'teamCount': instance.teamCount,
    };

_$NextImpl _$$NextImplFromJson(Map<String, dynamic> json) => _$NextImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      code: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      condition: json['condition'] as String? ?? '',
      firstLayer: (json['firstLayer'] as num?)?.toInt() ?? 0,
      secondLayer: (json['secondLayer'] as num?)?.toInt() ?? 0,
      thirdLayer: (json['thirdLayer'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      conditionDto: json['conditionDto'] == null
          ? null
          : ConditionDto.fromJson(json['conditionDto'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NextImplToJson(_$NextImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'condition': instance.condition,
      'firstLayer': instance.firstLayer,
      'secondLayer': instance.secondLayer,
      'thirdLayer': instance.thirdLayer,
      'description': instance.description,
      'conditionDto': instance.conditionDto,
    };

_$ConditionDtoImpl _$$ConditionDtoImplFromJson(Map<String, dynamic> json) =>
    _$ConditionDtoImpl(
      minPlanAmount: (json['minPlanAmount'] as num?)?.toDouble() ?? 0.0,
      directCount: (json['directCount'] as num?)?.toInt() ?? 0,
      teamCount: (json['teamCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ConditionDtoImplToJson(_$ConditionDtoImpl instance) =>
    <String, dynamic>{
      'minPlanAmount': instance.minPlanAmount,
      'directCount': instance.directCount,
      'teamCount': instance.teamCount,
    };
