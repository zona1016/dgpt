// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enable_job_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EnableJobInfo _$EnableJobInfoFromJson(Map<String, dynamic> json) {
  return _EnableJobInfo.fromJson(json);
}

/// @nodoc
mixin _$EnableJobInfo {
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNo')
  int get orderNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'condition')
  String get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'salary')
  double get salary => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthPlanAmount')
  double get monthPlanAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'enable')
  int get enable => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditionInfo')
  ConditionInfo? get conditionInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'createTime')
  String get createTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDelete')
  bool get isDelete => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;

  /// Serializes this EnableJobInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnableJobInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnableJobInfoCopyWith<EnableJobInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnableJobInfoCopyWith<$Res> {
  factory $EnableJobInfoCopyWith(
          EnableJobInfo value, $Res Function(EnableJobInfo) then) =
      _$EnableJobInfoCopyWithImpl<$Res, EnableJobInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'orderNo') int orderNo,
      @JsonKey(name: 'condition') String condition,
      @JsonKey(name: 'salary') double salary,
      @JsonKey(name: 'monthPlanAmount') double monthPlanAmount,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'enable') int enable,
      @JsonKey(name: 'conditionInfo') ConditionInfo? conditionInfo,
      @JsonKey(name: 'createTime') String createTime,
      @JsonKey(name: 'isDelete') bool isDelete,
      @JsonKey(name: 'id') int id});

  $ConditionInfoCopyWith<$Res>? get conditionInfo;
}

/// @nodoc
class _$EnableJobInfoCopyWithImpl<$Res, $Val extends EnableJobInfo>
    implements $EnableJobInfoCopyWith<$Res> {
  _$EnableJobInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnableJobInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? orderNo = null,
    Object? condition = null,
    Object? salary = null,
    Object? monthPlanAmount = null,
    Object? description = null,
    Object? enable = null,
    Object? conditionInfo = freezed,
    Object? createTime = null,
    Object? isDelete = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      orderNo: null == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double,
      monthPlanAmount: null == monthPlanAmount
          ? _value.monthPlanAmount
          : monthPlanAmount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as int,
      conditionInfo: freezed == conditionInfo
          ? _value.conditionInfo
          : conditionInfo // ignore: cast_nullable_to_non_nullable
              as ConditionInfo?,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      isDelete: null == isDelete
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of EnableJobInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConditionInfoCopyWith<$Res>? get conditionInfo {
    if (_value.conditionInfo == null) {
      return null;
    }

    return $ConditionInfoCopyWith<$Res>(_value.conditionInfo!, (value) {
      return _then(_value.copyWith(conditionInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EnableJobInfoImplCopyWith<$Res>
    implements $EnableJobInfoCopyWith<$Res> {
  factory _$$EnableJobInfoImplCopyWith(
          _$EnableJobInfoImpl value, $Res Function(_$EnableJobInfoImpl) then) =
      __$$EnableJobInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'orderNo') int orderNo,
      @JsonKey(name: 'condition') String condition,
      @JsonKey(name: 'salary') double salary,
      @JsonKey(name: 'monthPlanAmount') double monthPlanAmount,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'enable') int enable,
      @JsonKey(name: 'conditionInfo') ConditionInfo? conditionInfo,
      @JsonKey(name: 'createTime') String createTime,
      @JsonKey(name: 'isDelete') bool isDelete,
      @JsonKey(name: 'id') int id});

  @override
  $ConditionInfoCopyWith<$Res>? get conditionInfo;
}

/// @nodoc
class __$$EnableJobInfoImplCopyWithImpl<$Res>
    extends _$EnableJobInfoCopyWithImpl<$Res, _$EnableJobInfoImpl>
    implements _$$EnableJobInfoImplCopyWith<$Res> {
  __$$EnableJobInfoImplCopyWithImpl(
      _$EnableJobInfoImpl _value, $Res Function(_$EnableJobInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnableJobInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? orderNo = null,
    Object? condition = null,
    Object? salary = null,
    Object? monthPlanAmount = null,
    Object? description = null,
    Object? enable = null,
    Object? conditionInfo = freezed,
    Object? createTime = null,
    Object? isDelete = null,
    Object? id = null,
  }) {
    return _then(_$EnableJobInfoImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      orderNo: null == orderNo
          ? _value.orderNo
          : orderNo // ignore: cast_nullable_to_non_nullable
              as int,
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as double,
      monthPlanAmount: null == monthPlanAmount
          ? _value.monthPlanAmount
          : monthPlanAmount // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as int,
      conditionInfo: freezed == conditionInfo
          ? _value.conditionInfo
          : conditionInfo // ignore: cast_nullable_to_non_nullable
              as ConditionInfo?,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      isDelete: null == isDelete
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnableJobInfoImpl implements _EnableJobInfo {
  _$EnableJobInfoImpl(
      {@JsonKey(name: 'code') this.code = '',
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'orderNo') this.orderNo = 0,
      @JsonKey(name: 'condition') this.condition = '',
      @JsonKey(name: 'salary') this.salary = 0,
      @JsonKey(name: 'monthPlanAmount') this.monthPlanAmount = 0,
      @JsonKey(name: 'description') this.description = '',
      @JsonKey(name: 'enable') this.enable = 0,
      @JsonKey(name: 'conditionInfo') this.conditionInfo,
      @JsonKey(name: 'createTime') this.createTime = '',
      @JsonKey(name: 'isDelete') this.isDelete = false,
      @JsonKey(name: 'id') this.id = 0});

  factory _$EnableJobInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnableJobInfoImplFromJson(json);

  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'orderNo')
  final int orderNo;
  @override
  @JsonKey(name: 'condition')
  final String condition;
  @override
  @JsonKey(name: 'salary')
  final double salary;
  @override
  @JsonKey(name: 'monthPlanAmount')
  final double monthPlanAmount;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'enable')
  final int enable;
  @override
  @JsonKey(name: 'conditionInfo')
  final ConditionInfo? conditionInfo;
  @override
  @JsonKey(name: 'createTime')
  final String createTime;
  @override
  @JsonKey(name: 'isDelete')
  final bool isDelete;
  @override
  @JsonKey(name: 'id')
  final int id;

  @override
  String toString() {
    return 'EnableJobInfo(code: $code, name: $name, orderNo: $orderNo, condition: $condition, salary: $salary, monthPlanAmount: $monthPlanAmount, description: $description, enable: $enable, conditionInfo: $conditionInfo, createTime: $createTime, isDelete: $isDelete, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnableJobInfoImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.monthPlanAmount, monthPlanAmount) ||
                other.monthPlanAmount == monthPlanAmount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.enable, enable) || other.enable == enable) &&
            (identical(other.conditionInfo, conditionInfo) ||
                other.conditionInfo == conditionInfo) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      orderNo,
      condition,
      salary,
      monthPlanAmount,
      description,
      enable,
      conditionInfo,
      createTime,
      isDelete,
      id);

  /// Create a copy of EnableJobInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnableJobInfoImplCopyWith<_$EnableJobInfoImpl> get copyWith =>
      __$$EnableJobInfoImplCopyWithImpl<_$EnableJobInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnableJobInfoImplToJson(
      this,
    );
  }
}

abstract class _EnableJobInfo implements EnableJobInfo {
  factory _EnableJobInfo(
      {@JsonKey(name: 'code') final String code,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'orderNo') final int orderNo,
      @JsonKey(name: 'condition') final String condition,
      @JsonKey(name: 'salary') final double salary,
      @JsonKey(name: 'monthPlanAmount') final double monthPlanAmount,
      @JsonKey(name: 'description') final String description,
      @JsonKey(name: 'enable') final int enable,
      @JsonKey(name: 'conditionInfo') final ConditionInfo? conditionInfo,
      @JsonKey(name: 'createTime') final String createTime,
      @JsonKey(name: 'isDelete') final bool isDelete,
      @JsonKey(name: 'id') final int id}) = _$EnableJobInfoImpl;

  factory _EnableJobInfo.fromJson(Map<String, dynamic> json) =
      _$EnableJobInfoImpl.fromJson;

  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'orderNo')
  int get orderNo;
  @override
  @JsonKey(name: 'condition')
  String get condition;
  @override
  @JsonKey(name: 'salary')
  double get salary;
  @override
  @JsonKey(name: 'monthPlanAmount')
  double get monthPlanAmount;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'enable')
  int get enable;
  @override
  @JsonKey(name: 'conditionInfo')
  ConditionInfo? get conditionInfo;
  @override
  @JsonKey(name: 'createTime')
  String get createTime;
  @override
  @JsonKey(name: 'isDelete')
  bool get isDelete;
  @override
  @JsonKey(name: 'id')
  int get id;

  /// Create a copy of EnableJobInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnableJobInfoImplCopyWith<_$EnableJobInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConditionInfo _$ConditionInfoFromJson(Map<String, dynamic> json) {
  return _ConditionInfo.fromJson(json);
}

/// @nodoc
mixin _$ConditionInfo {
  @JsonKey(name: 'hashrateCode')
  String get hashrateCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'directHashrateCode')
  String get directHashrateCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'directHashrateCount')
  int get directHashrateCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'directJobTitleCode')
  String get directJobTitleCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'directJobTitleCount')
  int get directJobTitleCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'teamPlanAmountTotal')
  int get teamPlanAmountTotal => throw _privateConstructorUsedError;

  /// Serializes this ConditionInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConditionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConditionInfoCopyWith<ConditionInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionInfoCopyWith<$Res> {
  factory $ConditionInfoCopyWith(
          ConditionInfo value, $Res Function(ConditionInfo) then) =
      _$ConditionInfoCopyWithImpl<$Res, ConditionInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'hashrateCode') String hashrateCode,
      @JsonKey(name: 'directHashrateCode') String directHashrateCode,
      @JsonKey(name: 'directHashrateCount') int directHashrateCount,
      @JsonKey(name: 'directJobTitleCode') String directJobTitleCode,
      @JsonKey(name: 'directJobTitleCount') int directJobTitleCount,
      @JsonKey(name: 'teamPlanAmountTotal') int teamPlanAmountTotal});
}

/// @nodoc
class _$ConditionInfoCopyWithImpl<$Res, $Val extends ConditionInfo>
    implements $ConditionInfoCopyWith<$Res> {
  _$ConditionInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConditionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hashrateCode = null,
    Object? directHashrateCode = null,
    Object? directHashrateCount = null,
    Object? directJobTitleCode = null,
    Object? directJobTitleCount = null,
    Object? teamPlanAmountTotal = null,
  }) {
    return _then(_value.copyWith(
      hashrateCode: null == hashrateCode
          ? _value.hashrateCode
          : hashrateCode // ignore: cast_nullable_to_non_nullable
              as String,
      directHashrateCode: null == directHashrateCode
          ? _value.directHashrateCode
          : directHashrateCode // ignore: cast_nullable_to_non_nullable
              as String,
      directHashrateCount: null == directHashrateCount
          ? _value.directHashrateCount
          : directHashrateCount // ignore: cast_nullable_to_non_nullable
              as int,
      directJobTitleCode: null == directJobTitleCode
          ? _value.directJobTitleCode
          : directJobTitleCode // ignore: cast_nullable_to_non_nullable
              as String,
      directJobTitleCount: null == directJobTitleCount
          ? _value.directJobTitleCount
          : directJobTitleCount // ignore: cast_nullable_to_non_nullable
              as int,
      teamPlanAmountTotal: null == teamPlanAmountTotal
          ? _value.teamPlanAmountTotal
          : teamPlanAmountTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConditionInfoImplCopyWith<$Res>
    implements $ConditionInfoCopyWith<$Res> {
  factory _$$ConditionInfoImplCopyWith(
          _$ConditionInfoImpl value, $Res Function(_$ConditionInfoImpl) then) =
      __$$ConditionInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'hashrateCode') String hashrateCode,
      @JsonKey(name: 'directHashrateCode') String directHashrateCode,
      @JsonKey(name: 'directHashrateCount') int directHashrateCount,
      @JsonKey(name: 'directJobTitleCode') String directJobTitleCode,
      @JsonKey(name: 'directJobTitleCount') int directJobTitleCount,
      @JsonKey(name: 'teamPlanAmountTotal') int teamPlanAmountTotal});
}

/// @nodoc
class __$$ConditionInfoImplCopyWithImpl<$Res>
    extends _$ConditionInfoCopyWithImpl<$Res, _$ConditionInfoImpl>
    implements _$$ConditionInfoImplCopyWith<$Res> {
  __$$ConditionInfoImplCopyWithImpl(
      _$ConditionInfoImpl _value, $Res Function(_$ConditionInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hashrateCode = null,
    Object? directHashrateCode = null,
    Object? directHashrateCount = null,
    Object? directJobTitleCode = null,
    Object? directJobTitleCount = null,
    Object? teamPlanAmountTotal = null,
  }) {
    return _then(_$ConditionInfoImpl(
      hashrateCode: null == hashrateCode
          ? _value.hashrateCode
          : hashrateCode // ignore: cast_nullable_to_non_nullable
              as String,
      directHashrateCode: null == directHashrateCode
          ? _value.directHashrateCode
          : directHashrateCode // ignore: cast_nullable_to_non_nullable
              as String,
      directHashrateCount: null == directHashrateCount
          ? _value.directHashrateCount
          : directHashrateCount // ignore: cast_nullable_to_non_nullable
              as int,
      directJobTitleCode: null == directJobTitleCode
          ? _value.directJobTitleCode
          : directJobTitleCode // ignore: cast_nullable_to_non_nullable
              as String,
      directJobTitleCount: null == directJobTitleCount
          ? _value.directJobTitleCount
          : directJobTitleCount // ignore: cast_nullable_to_non_nullable
              as int,
      teamPlanAmountTotal: null == teamPlanAmountTotal
          ? _value.teamPlanAmountTotal
          : teamPlanAmountTotal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionInfoImpl implements _ConditionInfo {
  _$ConditionInfoImpl(
      {@JsonKey(name: 'hashrateCode') this.hashrateCode = '',
      @JsonKey(name: 'directHashrateCode') this.directHashrateCode = '',
      @JsonKey(name: 'directHashrateCount') this.directHashrateCount = 0,
      @JsonKey(name: 'directJobTitleCode') this.directJobTitleCode = '',
      @JsonKey(name: 'directJobTitleCount') this.directJobTitleCount = 0,
      @JsonKey(name: 'teamPlanAmountTotal') this.teamPlanAmountTotal = 0});

  factory _$ConditionInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionInfoImplFromJson(json);

  @override
  @JsonKey(name: 'hashrateCode')
  final String hashrateCode;
  @override
  @JsonKey(name: 'directHashrateCode')
  final String directHashrateCode;
  @override
  @JsonKey(name: 'directHashrateCount')
  final int directHashrateCount;
  @override
  @JsonKey(name: 'directJobTitleCode')
  final String directJobTitleCode;
  @override
  @JsonKey(name: 'directJobTitleCount')
  final int directJobTitleCount;
  @override
  @JsonKey(name: 'teamPlanAmountTotal')
  final int teamPlanAmountTotal;

  @override
  String toString() {
    return 'ConditionInfo(hashrateCode: $hashrateCode, directHashrateCode: $directHashrateCode, directHashrateCount: $directHashrateCount, directJobTitleCode: $directJobTitleCode, directJobTitleCount: $directJobTitleCount, teamPlanAmountTotal: $teamPlanAmountTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionInfoImpl &&
            (identical(other.hashrateCode, hashrateCode) ||
                other.hashrateCode == hashrateCode) &&
            (identical(other.directHashrateCode, directHashrateCode) ||
                other.directHashrateCode == directHashrateCode) &&
            (identical(other.directHashrateCount, directHashrateCount) ||
                other.directHashrateCount == directHashrateCount) &&
            (identical(other.directJobTitleCode, directJobTitleCode) ||
                other.directJobTitleCode == directJobTitleCode) &&
            (identical(other.directJobTitleCount, directJobTitleCount) ||
                other.directJobTitleCount == directJobTitleCount) &&
            (identical(other.teamPlanAmountTotal, teamPlanAmountTotal) ||
                other.teamPlanAmountTotal == teamPlanAmountTotal));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      hashrateCode,
      directHashrateCode,
      directHashrateCount,
      directJobTitleCode,
      directJobTitleCount,
      teamPlanAmountTotal);

  /// Create a copy of ConditionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionInfoImplCopyWith<_$ConditionInfoImpl> get copyWith =>
      __$$ConditionInfoImplCopyWithImpl<_$ConditionInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionInfoImplToJson(
      this,
    );
  }
}

abstract class _ConditionInfo implements ConditionInfo {
  factory _ConditionInfo(
      {@JsonKey(name: 'hashrateCode') final String hashrateCode,
      @JsonKey(name: 'directHashrateCode') final String directHashrateCode,
      @JsonKey(name: 'directHashrateCount') final int directHashrateCount,
      @JsonKey(name: 'directJobTitleCode') final String directJobTitleCode,
      @JsonKey(name: 'directJobTitleCount') final int directJobTitleCount,
      @JsonKey(name: 'teamPlanAmountTotal')
      final int teamPlanAmountTotal}) = _$ConditionInfoImpl;

  factory _ConditionInfo.fromJson(Map<String, dynamic> json) =
      _$ConditionInfoImpl.fromJson;

  @override
  @JsonKey(name: 'hashrateCode')
  String get hashrateCode;
  @override
  @JsonKey(name: 'directHashrateCode')
  String get directHashrateCode;
  @override
  @JsonKey(name: 'directHashrateCount')
  int get directHashrateCount;
  @override
  @JsonKey(name: 'directJobTitleCode')
  String get directJobTitleCode;
  @override
  @JsonKey(name: 'directJobTitleCount')
  int get directJobTitleCount;
  @override
  @JsonKey(name: 'teamPlanAmountTotal')
  int get teamPlanAmountTotal;

  /// Create a copy of ConditionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionInfoImplCopyWith<_$ConditionInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
