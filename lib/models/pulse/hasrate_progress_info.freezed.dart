// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hasrate_progress_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HasrateProgressInfo _$HasrateProgressInfoFromJson(Map<String, dynamic> json) {
  return _HasrateProgressInfo.fromJson(json);
}

/// @nodoc
mixin _$HasrateProgressInfo {
  @JsonKey(name: 'next')
  Next get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'planAmount')
  int get planAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'directCount')
  int get directCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'teamCount')
  int get teamCount => throw _privateConstructorUsedError;

  /// Serializes this HasrateProgressInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HasrateProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HasrateProgressInfoCopyWith<HasrateProgressInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HasrateProgressInfoCopyWith<$Res> {
  factory $HasrateProgressInfoCopyWith(
          HasrateProgressInfo value, $Res Function(HasrateProgressInfo) then) =
      _$HasrateProgressInfoCopyWithImpl<$Res, HasrateProgressInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'next') Next next,
      @JsonKey(name: 'planAmount') int planAmount,
      @JsonKey(name: 'directCount') int directCount,
      @JsonKey(name: 'teamCount') int teamCount});

  $NextCopyWith<$Res> get next;
}

/// @nodoc
class _$HasrateProgressInfoCopyWithImpl<$Res, $Val extends HasrateProgressInfo>
    implements $HasrateProgressInfoCopyWith<$Res> {
  _$HasrateProgressInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HasrateProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = null,
    Object? planAmount = null,
    Object? directCount = null,
    Object? teamCount = null,
  }) {
    return _then(_value.copyWith(
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as Next,
      planAmount: null == planAmount
          ? _value.planAmount
          : planAmount // ignore: cast_nullable_to_non_nullable
              as int,
      directCount: null == directCount
          ? _value.directCount
          : directCount // ignore: cast_nullable_to_non_nullable
              as int,
      teamCount: null == teamCount
          ? _value.teamCount
          : teamCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of HasrateProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NextCopyWith<$Res> get next {
    return $NextCopyWith<$Res>(_value.next, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HasrateProgressInfoImplCopyWith<$Res>
    implements $HasrateProgressInfoCopyWith<$Res> {
  factory _$$HasrateProgressInfoImplCopyWith(_$HasrateProgressInfoImpl value,
          $Res Function(_$HasrateProgressInfoImpl) then) =
      __$$HasrateProgressInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'next') Next next,
      @JsonKey(name: 'planAmount') int planAmount,
      @JsonKey(name: 'directCount') int directCount,
      @JsonKey(name: 'teamCount') int teamCount});

  @override
  $NextCopyWith<$Res> get next;
}

/// @nodoc
class __$$HasrateProgressInfoImplCopyWithImpl<$Res>
    extends _$HasrateProgressInfoCopyWithImpl<$Res, _$HasrateProgressInfoImpl>
    implements _$$HasrateProgressInfoImplCopyWith<$Res> {
  __$$HasrateProgressInfoImplCopyWithImpl(_$HasrateProgressInfoImpl _value,
      $Res Function(_$HasrateProgressInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of HasrateProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = null,
    Object? planAmount = null,
    Object? directCount = null,
    Object? teamCount = null,
  }) {
    return _then(_$HasrateProgressInfoImpl(
      next: null == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as Next,
      planAmount: null == planAmount
          ? _value.planAmount
          : planAmount // ignore: cast_nullable_to_non_nullable
              as int,
      directCount: null == directCount
          ? _value.directCount
          : directCount // ignore: cast_nullable_to_non_nullable
              as int,
      teamCount: null == teamCount
          ? _value.teamCount
          : teamCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HasrateProgressInfoImpl implements _HasrateProgressInfo {
  _$HasrateProgressInfoImpl(
      {@JsonKey(name: 'next') required this.next,
      @JsonKey(name: 'planAmount') required this.planAmount,
      @JsonKey(name: 'directCount') required this.directCount,
      @JsonKey(name: 'teamCount') required this.teamCount});

  factory _$HasrateProgressInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HasrateProgressInfoImplFromJson(json);

  @override
  @JsonKey(name: 'next')
  final Next next;
  @override
  @JsonKey(name: 'planAmount')
  final int planAmount;
  @override
  @JsonKey(name: 'directCount')
  final int directCount;
  @override
  @JsonKey(name: 'teamCount')
  final int teamCount;

  @override
  String toString() {
    return 'HasrateProgressInfo(next: $next, planAmount: $planAmount, directCount: $directCount, teamCount: $teamCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HasrateProgressInfoImpl &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.planAmount, planAmount) ||
                other.planAmount == planAmount) &&
            (identical(other.directCount, directCount) ||
                other.directCount == directCount) &&
            (identical(other.teamCount, teamCount) ||
                other.teamCount == teamCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, next, planAmount, directCount, teamCount);

  /// Create a copy of HasrateProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HasrateProgressInfoImplCopyWith<_$HasrateProgressInfoImpl> get copyWith =>
      __$$HasrateProgressInfoImplCopyWithImpl<_$HasrateProgressInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HasrateProgressInfoImplToJson(
      this,
    );
  }
}

abstract class _HasrateProgressInfo implements HasrateProgressInfo {
  factory _HasrateProgressInfo(
          {@JsonKey(name: 'next') required final Next next,
          @JsonKey(name: 'planAmount') required final int planAmount,
          @JsonKey(name: 'directCount') required final int directCount,
          @JsonKey(name: 'teamCount') required final int teamCount}) =
      _$HasrateProgressInfoImpl;

  factory _HasrateProgressInfo.fromJson(Map<String, dynamic> json) =
      _$HasrateProgressInfoImpl.fromJson;

  @override
  @JsonKey(name: 'next')
  Next get next;
  @override
  @JsonKey(name: 'planAmount')
  int get planAmount;
  @override
  @JsonKey(name: 'directCount')
  int get directCount;
  @override
  @JsonKey(name: 'teamCount')
  int get teamCount;

  /// Create a copy of HasrateProgressInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HasrateProgressInfoImplCopyWith<_$HasrateProgressInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Next _$NextFromJson(Map<String, dynamic> json) {
  return _Next.fromJson(json);
}

/// @nodoc
mixin _$Next {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'createTime')
  String get createTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'updateTime')
  String get updateTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'createUserId')
  int get createUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'createUserName')
  String get createUserName => throw _privateConstructorUsedError;
  @JsonKey(name: 'updateUserId')
  int get updateUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'updateUserName')
  String get updateUserName => throw _privateConstructorUsedError;
  @JsonKey(name: 'isDelete')
  bool get isDelete => throw _privateConstructorUsedError;
  @JsonKey(name: 'sysExtInfo')
  String get sysExtInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'orderNo')
  int get orderNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'condition')
  String get condition => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstLayer')
  int get firstLayer => throw _privateConstructorUsedError;
  @JsonKey(name: 'secondLayer')
  int get secondLayer => throw _privateConstructorUsedError;
  @JsonKey(name: 'thirdLayer')
  int get thirdLayer => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'enable')
  int get enable => throw _privateConstructorUsedError;
  @JsonKey(name: 'remark')
  String get remark => throw _privateConstructorUsedError;

  /// Serializes this Next to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Next
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NextCopyWith<Next> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextCopyWith<$Res> {
  factory $NextCopyWith(Next value, $Res Function(Next) then) =
      _$NextCopyWithImpl<$Res, Next>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'createTime') String createTime,
      @JsonKey(name: 'updateTime') String updateTime,
      @JsonKey(name: 'createUserId') int createUserId,
      @JsonKey(name: 'createUserName') String createUserName,
      @JsonKey(name: 'updateUserId') int updateUserId,
      @JsonKey(name: 'updateUserName') String updateUserName,
      @JsonKey(name: 'isDelete') bool isDelete,
      @JsonKey(name: 'sysExtInfo') String sysExtInfo,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'orderNo') int orderNo,
      @JsonKey(name: 'condition') String condition,
      @JsonKey(name: 'firstLayer') int firstLayer,
      @JsonKey(name: 'secondLayer') int secondLayer,
      @JsonKey(name: 'thirdLayer') int thirdLayer,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'enable') int enable,
      @JsonKey(name: 'remark') String remark});
}

/// @nodoc
class _$NextCopyWithImpl<$Res, $Val extends Next>
    implements $NextCopyWith<$Res> {
  _$NextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Next
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? createUserId = null,
    Object? createUserName = null,
    Object? updateUserId = null,
    Object? updateUserName = null,
    Object? isDelete = null,
    Object? sysExtInfo = null,
    Object? code = null,
    Object? name = null,
    Object? orderNo = null,
    Object? condition = null,
    Object? firstLayer = null,
    Object? secondLayer = null,
    Object? thirdLayer = null,
    Object? description = null,
    Object? enable = null,
    Object? remark = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
      createUserId: null == createUserId
          ? _value.createUserId
          : createUserId // ignore: cast_nullable_to_non_nullable
              as int,
      createUserName: null == createUserName
          ? _value.createUserName
          : createUserName // ignore: cast_nullable_to_non_nullable
              as String,
      updateUserId: null == updateUserId
          ? _value.updateUserId
          : updateUserId // ignore: cast_nullable_to_non_nullable
              as int,
      updateUserName: null == updateUserName
          ? _value.updateUserName
          : updateUserName // ignore: cast_nullable_to_non_nullable
              as String,
      isDelete: null == isDelete
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      sysExtInfo: null == sysExtInfo
          ? _value.sysExtInfo
          : sysExtInfo // ignore: cast_nullable_to_non_nullable
              as String,
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
      firstLayer: null == firstLayer
          ? _value.firstLayer
          : firstLayer // ignore: cast_nullable_to_non_nullable
              as int,
      secondLayer: null == secondLayer
          ? _value.secondLayer
          : secondLayer // ignore: cast_nullable_to_non_nullable
              as int,
      thirdLayer: null == thirdLayer
          ? _value.thirdLayer
          : thirdLayer // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as int,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NextImplCopyWith<$Res> implements $NextCopyWith<$Res> {
  factory _$$NextImplCopyWith(
          _$NextImpl value, $Res Function(_$NextImpl) then) =
      __$$NextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'createTime') String createTime,
      @JsonKey(name: 'updateTime') String updateTime,
      @JsonKey(name: 'createUserId') int createUserId,
      @JsonKey(name: 'createUserName') String createUserName,
      @JsonKey(name: 'updateUserId') int updateUserId,
      @JsonKey(name: 'updateUserName') String updateUserName,
      @JsonKey(name: 'isDelete') bool isDelete,
      @JsonKey(name: 'sysExtInfo') String sysExtInfo,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'orderNo') int orderNo,
      @JsonKey(name: 'condition') String condition,
      @JsonKey(name: 'firstLayer') int firstLayer,
      @JsonKey(name: 'secondLayer') int secondLayer,
      @JsonKey(name: 'thirdLayer') int thirdLayer,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'enable') int enable,
      @JsonKey(name: 'remark') String remark});
}

/// @nodoc
class __$$NextImplCopyWithImpl<$Res>
    extends _$NextCopyWithImpl<$Res, _$NextImpl>
    implements _$$NextImplCopyWith<$Res> {
  __$$NextImplCopyWithImpl(_$NextImpl _value, $Res Function(_$NextImpl) _then)
      : super(_value, _then);

  /// Create a copy of Next
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createTime = null,
    Object? updateTime = null,
    Object? createUserId = null,
    Object? createUserName = null,
    Object? updateUserId = null,
    Object? updateUserName = null,
    Object? isDelete = null,
    Object? sysExtInfo = null,
    Object? code = null,
    Object? name = null,
    Object? orderNo = null,
    Object? condition = null,
    Object? firstLayer = null,
    Object? secondLayer = null,
    Object? thirdLayer = null,
    Object? description = null,
    Object? enable = null,
    Object? remark = null,
  }) {
    return _then(_$NextImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createTime: null == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as String,
      updateTime: null == updateTime
          ? _value.updateTime
          : updateTime // ignore: cast_nullable_to_non_nullable
              as String,
      createUserId: null == createUserId
          ? _value.createUserId
          : createUserId // ignore: cast_nullable_to_non_nullable
              as int,
      createUserName: null == createUserName
          ? _value.createUserName
          : createUserName // ignore: cast_nullable_to_non_nullable
              as String,
      updateUserId: null == updateUserId
          ? _value.updateUserId
          : updateUserId // ignore: cast_nullable_to_non_nullable
              as int,
      updateUserName: null == updateUserName
          ? _value.updateUserName
          : updateUserName // ignore: cast_nullable_to_non_nullable
              as String,
      isDelete: null == isDelete
          ? _value.isDelete
          : isDelete // ignore: cast_nullable_to_non_nullable
              as bool,
      sysExtInfo: null == sysExtInfo
          ? _value.sysExtInfo
          : sysExtInfo // ignore: cast_nullable_to_non_nullable
              as String,
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
      firstLayer: null == firstLayer
          ? _value.firstLayer
          : firstLayer // ignore: cast_nullable_to_non_nullable
              as int,
      secondLayer: null == secondLayer
          ? _value.secondLayer
          : secondLayer // ignore: cast_nullable_to_non_nullable
              as int,
      thirdLayer: null == thirdLayer
          ? _value.thirdLayer
          : thirdLayer // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      enable: null == enable
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as int,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NextImpl implements _Next {
  _$NextImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'createTime') required this.createTime,
      @JsonKey(name: 'updateTime') required this.updateTime,
      @JsonKey(name: 'createUserId') required this.createUserId,
      @JsonKey(name: 'createUserName') required this.createUserName,
      @JsonKey(name: 'updateUserId') required this.updateUserId,
      @JsonKey(name: 'updateUserName') required this.updateUserName,
      @JsonKey(name: 'isDelete') required this.isDelete,
      @JsonKey(name: 'sysExtInfo') required this.sysExtInfo,
      @JsonKey(name: 'code') required this.code,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'orderNo') required this.orderNo,
      @JsonKey(name: 'condition') required this.condition,
      @JsonKey(name: 'firstLayer') required this.firstLayer,
      @JsonKey(name: 'secondLayer') required this.secondLayer,
      @JsonKey(name: 'thirdLayer') required this.thirdLayer,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'enable') required this.enable,
      @JsonKey(name: 'remark') required this.remark});

  factory _$NextImpl.fromJson(Map<String, dynamic> json) =>
      _$$NextImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'createTime')
  final String createTime;
  @override
  @JsonKey(name: 'updateTime')
  final String updateTime;
  @override
  @JsonKey(name: 'createUserId')
  final int createUserId;
  @override
  @JsonKey(name: 'createUserName')
  final String createUserName;
  @override
  @JsonKey(name: 'updateUserId')
  final int updateUserId;
  @override
  @JsonKey(name: 'updateUserName')
  final String updateUserName;
  @override
  @JsonKey(name: 'isDelete')
  final bool isDelete;
  @override
  @JsonKey(name: 'sysExtInfo')
  final String sysExtInfo;
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
  @JsonKey(name: 'firstLayer')
  final int firstLayer;
  @override
  @JsonKey(name: 'secondLayer')
  final int secondLayer;
  @override
  @JsonKey(name: 'thirdLayer')
  final int thirdLayer;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'enable')
  final int enable;
  @override
  @JsonKey(name: 'remark')
  final String remark;

  @override
  String toString() {
    return 'Next(id: $id, createTime: $createTime, updateTime: $updateTime, createUserId: $createUserId, createUserName: $createUserName, updateUserId: $updateUserId, updateUserName: $updateUserName, isDelete: $isDelete, sysExtInfo: $sysExtInfo, code: $code, name: $name, orderNo: $orderNo, condition: $condition, firstLayer: $firstLayer, secondLayer: $secondLayer, thirdLayer: $thirdLayer, description: $description, enable: $enable, remark: $remark)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.updateTime, updateTime) ||
                other.updateTime == updateTime) &&
            (identical(other.createUserId, createUserId) ||
                other.createUserId == createUserId) &&
            (identical(other.createUserName, createUserName) ||
                other.createUserName == createUserName) &&
            (identical(other.updateUserId, updateUserId) ||
                other.updateUserId == updateUserId) &&
            (identical(other.updateUserName, updateUserName) ||
                other.updateUserName == updateUserName) &&
            (identical(other.isDelete, isDelete) ||
                other.isDelete == isDelete) &&
            (identical(other.sysExtInfo, sysExtInfo) ||
                other.sysExtInfo == sysExtInfo) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.orderNo, orderNo) || other.orderNo == orderNo) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.firstLayer, firstLayer) ||
                other.firstLayer == firstLayer) &&
            (identical(other.secondLayer, secondLayer) ||
                other.secondLayer == secondLayer) &&
            (identical(other.thirdLayer, thirdLayer) ||
                other.thirdLayer == thirdLayer) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.enable, enable) || other.enable == enable) &&
            (identical(other.remark, remark) || other.remark == remark));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createTime,
        updateTime,
        createUserId,
        createUserName,
        updateUserId,
        updateUserName,
        isDelete,
        sysExtInfo,
        code,
        name,
        orderNo,
        condition,
        firstLayer,
        secondLayer,
        thirdLayer,
        description,
        enable,
        remark
      ]);

  /// Create a copy of Next
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NextImplCopyWith<_$NextImpl> get copyWith =>
      __$$NextImplCopyWithImpl<_$NextImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NextImplToJson(
      this,
    );
  }
}

abstract class _Next implements Next {
  factory _Next(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'createTime') required final String createTime,
      @JsonKey(name: 'updateTime') required final String updateTime,
      @JsonKey(name: 'createUserId') required final int createUserId,
      @JsonKey(name: 'createUserName') required final String createUserName,
      @JsonKey(name: 'updateUserId') required final int updateUserId,
      @JsonKey(name: 'updateUserName') required final String updateUserName,
      @JsonKey(name: 'isDelete') required final bool isDelete,
      @JsonKey(name: 'sysExtInfo') required final String sysExtInfo,
      @JsonKey(name: 'code') required final String code,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'orderNo') required final int orderNo,
      @JsonKey(name: 'condition') required final String condition,
      @JsonKey(name: 'firstLayer') required final int firstLayer,
      @JsonKey(name: 'secondLayer') required final int secondLayer,
      @JsonKey(name: 'thirdLayer') required final int thirdLayer,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'enable') required final int enable,
      @JsonKey(name: 'remark') required final String remark}) = _$NextImpl;

  factory _Next.fromJson(Map<String, dynamic> json) = _$NextImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'createTime')
  String get createTime;
  @override
  @JsonKey(name: 'updateTime')
  String get updateTime;
  @override
  @JsonKey(name: 'createUserId')
  int get createUserId;
  @override
  @JsonKey(name: 'createUserName')
  String get createUserName;
  @override
  @JsonKey(name: 'updateUserId')
  int get updateUserId;
  @override
  @JsonKey(name: 'updateUserName')
  String get updateUserName;
  @override
  @JsonKey(name: 'isDelete')
  bool get isDelete;
  @override
  @JsonKey(name: 'sysExtInfo')
  String get sysExtInfo;
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
  @JsonKey(name: 'firstLayer')
  int get firstLayer;
  @override
  @JsonKey(name: 'secondLayer')
  int get secondLayer;
  @override
  @JsonKey(name: 'thirdLayer')
  int get thirdLayer;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'enable')
  int get enable;
  @override
  @JsonKey(name: 'remark')
  String get remark;

  /// Create a copy of Next
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NextImplCopyWith<_$NextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
