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
  Next? get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'planAmount')
  double get planAmount => throw _privateConstructorUsedError;
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
      {@JsonKey(name: 'next') Next? next,
      @JsonKey(name: 'planAmount') double planAmount,
      @JsonKey(name: 'directCount') int directCount,
      @JsonKey(name: 'teamCount') int teamCount});

  $NextCopyWith<$Res>? get next;
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
    Object? next = freezed,
    Object? planAmount = null,
    Object? directCount = null,
    Object? teamCount = null,
  }) {
    return _then(_value.copyWith(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as Next?,
      planAmount: null == planAmount
          ? _value.planAmount
          : planAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
  $NextCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $NextCopyWith<$Res>(_value.next!, (value) {
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
      {@JsonKey(name: 'next') Next? next,
      @JsonKey(name: 'planAmount') double planAmount,
      @JsonKey(name: 'directCount') int directCount,
      @JsonKey(name: 'teamCount') int teamCount});

  @override
  $NextCopyWith<$Res>? get next;
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
    Object? next = freezed,
    Object? planAmount = null,
    Object? directCount = null,
    Object? teamCount = null,
  }) {
    return _then(_$HasrateProgressInfoImpl(
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as Next?,
      planAmount: null == planAmount
          ? _value.planAmount
          : planAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
      {@JsonKey(name: 'next') this.next,
      @JsonKey(name: 'planAmount') this.planAmount = 0.0,
      @JsonKey(name: 'directCount') this.directCount = 0,
      @JsonKey(name: 'teamCount') this.teamCount = 0});

  factory _$HasrateProgressInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HasrateProgressInfoImplFromJson(json);

  @override
  @JsonKey(name: 'next')
  final Next? next;
  @override
  @JsonKey(name: 'planAmount')
  final double planAmount;
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
          {@JsonKey(name: 'next') final Next? next,
          @JsonKey(name: 'planAmount') final double planAmount,
          @JsonKey(name: 'directCount') final int directCount,
          @JsonKey(name: 'teamCount') final int teamCount}) =
      _$HasrateProgressInfoImpl;

  factory _HasrateProgressInfo.fromJson(Map<String, dynamic> json) =
      _$HasrateProgressInfoImpl.fromJson;

  @override
  @JsonKey(name: 'next')
  Next? get next;
  @override
  @JsonKey(name: 'planAmount')
  double get planAmount;
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
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'conditionDto')
  ConditionDto? get conditionDto => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'condition') String condition,
      @JsonKey(name: 'firstLayer') int firstLayer,
      @JsonKey(name: 'secondLayer') int secondLayer,
      @JsonKey(name: 'thirdLayer') int thirdLayer,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'conditionDto') ConditionDto? conditionDto});

  $ConditionDtoCopyWith<$Res>? get conditionDto;
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
    Object? code = null,
    Object? name = null,
    Object? condition = null,
    Object? firstLayer = null,
    Object? secondLayer = null,
    Object? thirdLayer = null,
    Object? description = null,
    Object? conditionDto = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      conditionDto: freezed == conditionDto
          ? _value.conditionDto
          : conditionDto // ignore: cast_nullable_to_non_nullable
              as ConditionDto?,
    ) as $Val);
  }

  /// Create a copy of Next
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConditionDtoCopyWith<$Res>? get conditionDto {
    if (_value.conditionDto == null) {
      return null;
    }

    return $ConditionDtoCopyWith<$Res>(_value.conditionDto!, (value) {
      return _then(_value.copyWith(conditionDto: value) as $Val);
    });
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
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'condition') String condition,
      @JsonKey(name: 'firstLayer') int firstLayer,
      @JsonKey(name: 'secondLayer') int secondLayer,
      @JsonKey(name: 'thirdLayer') int thirdLayer,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'conditionDto') ConditionDto? conditionDto});

  @override
  $ConditionDtoCopyWith<$Res>? get conditionDto;
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
    Object? code = null,
    Object? name = null,
    Object? condition = null,
    Object? firstLayer = null,
    Object? secondLayer = null,
    Object? thirdLayer = null,
    Object? description = null,
    Object? conditionDto = freezed,
  }) {
    return _then(_$NextImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
      conditionDto: freezed == conditionDto
          ? _value.conditionDto
          : conditionDto // ignore: cast_nullable_to_non_nullable
              as ConditionDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NextImpl implements _Next {
  _$NextImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'code') this.code = '',
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'condition') this.condition = '',
      @JsonKey(name: 'firstLayer') this.firstLayer = 0,
      @JsonKey(name: 'secondLayer') this.secondLayer = 0,
      @JsonKey(name: 'thirdLayer') this.thirdLayer = 0,
      @JsonKey(name: 'description') this.description = '',
      @JsonKey(name: 'conditionDto') this.conditionDto});

  factory _$NextImpl.fromJson(Map<String, dynamic> json) =>
      _$$NextImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'name')
  final String name;
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
  @JsonKey(name: 'conditionDto')
  final ConditionDto? conditionDto;

  @override
  String toString() {
    return 'Next(id: $id, code: $code, name: $name, condition: $condition, firstLayer: $firstLayer, secondLayer: $secondLayer, thirdLayer: $thirdLayer, description: $description, conditionDto: $conditionDto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NextImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
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
            (identical(other.conditionDto, conditionDto) ||
                other.conditionDto == conditionDto));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, condition,
      firstLayer, secondLayer, thirdLayer, description, conditionDto);

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
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'code') final String code,
          @JsonKey(name: 'name') final String name,
          @JsonKey(name: 'condition') final String condition,
          @JsonKey(name: 'firstLayer') final int firstLayer,
          @JsonKey(name: 'secondLayer') final int secondLayer,
          @JsonKey(name: 'thirdLayer') final int thirdLayer,
          @JsonKey(name: 'description') final String description,
          @JsonKey(name: 'conditionDto') final ConditionDto? conditionDto}) =
      _$NextImpl;

  factory _Next.fromJson(Map<String, dynamic> json) = _$NextImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'name')
  String get name;
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
  @JsonKey(name: 'conditionDto')
  ConditionDto? get conditionDto;

  /// Create a copy of Next
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NextImplCopyWith<_$NextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ConditionDto _$ConditionDtoFromJson(Map<String, dynamic> json) {
  return _ConditionDto.fromJson(json);
}

/// @nodoc
mixin _$ConditionDto {
  @JsonKey(name: 'minPlanAmount')
  double get minPlanAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'directCount')
  int get directCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'teamCount')
  int get teamCount => throw _privateConstructorUsedError;

  /// Serializes this ConditionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConditionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConditionDtoCopyWith<ConditionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionDtoCopyWith<$Res> {
  factory $ConditionDtoCopyWith(
          ConditionDto value, $Res Function(ConditionDto) then) =
      _$ConditionDtoCopyWithImpl<$Res, ConditionDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'minPlanAmount') double minPlanAmount,
      @JsonKey(name: 'directCount') int directCount,
      @JsonKey(name: 'teamCount') int teamCount});
}

/// @nodoc
class _$ConditionDtoCopyWithImpl<$Res, $Val extends ConditionDto>
    implements $ConditionDtoCopyWith<$Res> {
  _$ConditionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConditionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPlanAmount = null,
    Object? directCount = null,
    Object? teamCount = null,
  }) {
    return _then(_value.copyWith(
      minPlanAmount: null == minPlanAmount
          ? _value.minPlanAmount
          : minPlanAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
}

/// @nodoc
abstract class _$$ConditionDtoImplCopyWith<$Res>
    implements $ConditionDtoCopyWith<$Res> {
  factory _$$ConditionDtoImplCopyWith(
          _$ConditionDtoImpl value, $Res Function(_$ConditionDtoImpl) then) =
      __$$ConditionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'minPlanAmount') double minPlanAmount,
      @JsonKey(name: 'directCount') int directCount,
      @JsonKey(name: 'teamCount') int teamCount});
}

/// @nodoc
class __$$ConditionDtoImplCopyWithImpl<$Res>
    extends _$ConditionDtoCopyWithImpl<$Res, _$ConditionDtoImpl>
    implements _$$ConditionDtoImplCopyWith<$Res> {
  __$$ConditionDtoImplCopyWithImpl(
      _$ConditionDtoImpl _value, $Res Function(_$ConditionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConditionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minPlanAmount = null,
    Object? directCount = null,
    Object? teamCount = null,
  }) {
    return _then(_$ConditionDtoImpl(
      minPlanAmount: null == minPlanAmount
          ? _value.minPlanAmount
          : minPlanAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$ConditionDtoImpl implements _ConditionDto {
  _$ConditionDtoImpl(
      {@JsonKey(name: 'minPlanAmount') this.minPlanAmount = 0.0,
      @JsonKey(name: 'directCount') this.directCount = 0,
      @JsonKey(name: 'teamCount') this.teamCount = 0});

  factory _$ConditionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionDtoImplFromJson(json);

  @override
  @JsonKey(name: 'minPlanAmount')
  final double minPlanAmount;
  @override
  @JsonKey(name: 'directCount')
  final int directCount;
  @override
  @JsonKey(name: 'teamCount')
  final int teamCount;

  @override
  String toString() {
    return 'ConditionDto(minPlanAmount: $minPlanAmount, directCount: $directCount, teamCount: $teamCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionDtoImpl &&
            (identical(other.minPlanAmount, minPlanAmount) ||
                other.minPlanAmount == minPlanAmount) &&
            (identical(other.directCount, directCount) ||
                other.directCount == directCount) &&
            (identical(other.teamCount, teamCount) ||
                other.teamCount == teamCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, minPlanAmount, directCount, teamCount);

  /// Create a copy of ConditionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionDtoImplCopyWith<_$ConditionDtoImpl> get copyWith =>
      __$$ConditionDtoImplCopyWithImpl<_$ConditionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionDtoImplToJson(
      this,
    );
  }
}

abstract class _ConditionDto implements ConditionDto {
  factory _ConditionDto(
      {@JsonKey(name: 'minPlanAmount') final double minPlanAmount,
      @JsonKey(name: 'directCount') final int directCount,
      @JsonKey(name: 'teamCount') final int teamCount}) = _$ConditionDtoImpl;

  factory _ConditionDto.fromJson(Map<String, dynamic> json) =
      _$ConditionDtoImpl.fromJson;

  @override
  @JsonKey(name: 'minPlanAmount')
  double get minPlanAmount;
  @override
  @JsonKey(name: 'directCount')
  int get directCount;
  @override
  @JsonKey(name: 'teamCount')
  int get teamCount;

  /// Create a copy of ConditionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionDtoImplCopyWith<_$ConditionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
