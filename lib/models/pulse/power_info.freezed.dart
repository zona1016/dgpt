// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'power_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PowerInfo _$PowerInfoFromJson(Map<String, dynamic> json) {
  return _PowerInfo.fromJson(json);
}

/// @nodoc
mixin _$PowerInfo {
  @JsonKey(name: 'createDate')
  String get createDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstLayer')
  double get firstLayer => throw _privateConstructorUsedError;
  @JsonKey(name: 'secondLayer')
  double get secondLayer => throw _privateConstructorUsedError;
  @JsonKey(name: 'thirdLayer')
  double get thirdLayer => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;

  /// Serializes this PowerInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PowerInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PowerInfoCopyWith<PowerInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PowerInfoCopyWith<$Res> {
  factory $PowerInfoCopyWith(PowerInfo value, $Res Function(PowerInfo) then) =
      _$PowerInfoCopyWithImpl<$Res, PowerInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'createDate') String createDate,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'firstLayer') double firstLayer,
      @JsonKey(name: 'secondLayer') double secondLayer,
      @JsonKey(name: 'thirdLayer') double thirdLayer,
      @JsonKey(name: 'description') String description});
}

/// @nodoc
class _$PowerInfoCopyWithImpl<$Res, $Val extends PowerInfo>
    implements $PowerInfoCopyWith<$Res> {
  _$PowerInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PowerInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createDate = null,
    Object? code = null,
    Object? name = null,
    Object? firstLayer = null,
    Object? secondLayer = null,
    Object? thirdLayer = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      firstLayer: null == firstLayer
          ? _value.firstLayer
          : firstLayer // ignore: cast_nullable_to_non_nullable
              as double,
      secondLayer: null == secondLayer
          ? _value.secondLayer
          : secondLayer // ignore: cast_nullable_to_non_nullable
              as double,
      thirdLayer: null == thirdLayer
          ? _value.thirdLayer
          : thirdLayer // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PowerInfoImplCopyWith<$Res>
    implements $PowerInfoCopyWith<$Res> {
  factory _$$PowerInfoImplCopyWith(
          _$PowerInfoImpl value, $Res Function(_$PowerInfoImpl) then) =
      __$$PowerInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'createDate') String createDate,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'firstLayer') double firstLayer,
      @JsonKey(name: 'secondLayer') double secondLayer,
      @JsonKey(name: 'thirdLayer') double thirdLayer,
      @JsonKey(name: 'description') String description});
}

/// @nodoc
class __$$PowerInfoImplCopyWithImpl<$Res>
    extends _$PowerInfoCopyWithImpl<$Res, _$PowerInfoImpl>
    implements _$$PowerInfoImplCopyWith<$Res> {
  __$$PowerInfoImplCopyWithImpl(
      _$PowerInfoImpl _value, $Res Function(_$PowerInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PowerInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createDate = null,
    Object? code = null,
    Object? name = null,
    Object? firstLayer = null,
    Object? secondLayer = null,
    Object? thirdLayer = null,
    Object? description = null,
  }) {
    return _then(_$PowerInfoImpl(
      createDate: null == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      firstLayer: null == firstLayer
          ? _value.firstLayer
          : firstLayer // ignore: cast_nullable_to_non_nullable
              as double,
      secondLayer: null == secondLayer
          ? _value.secondLayer
          : secondLayer // ignore: cast_nullable_to_non_nullable
              as double,
      thirdLayer: null == thirdLayer
          ? _value.thirdLayer
          : thirdLayer // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PowerInfoImpl implements _PowerInfo {
  _$PowerInfoImpl(
      {@JsonKey(name: 'createDate') this.createDate = '',
      @JsonKey(name: 'code') this.code = '',
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'firstLayer') this.firstLayer = 0.0,
      @JsonKey(name: 'secondLayer') this.secondLayer = 0.0,
      @JsonKey(name: 'thirdLayer') this.thirdLayer = 0.0,
      @JsonKey(name: 'description') this.description = ''});

  factory _$PowerInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PowerInfoImplFromJson(json);

  @override
  @JsonKey(name: 'createDate')
  final String createDate;
  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'firstLayer')
  final double firstLayer;
  @override
  @JsonKey(name: 'secondLayer')
  final double secondLayer;
  @override
  @JsonKey(name: 'thirdLayer')
  final double thirdLayer;
  @override
  @JsonKey(name: 'description')
  final String description;

  @override
  String toString() {
    return 'PowerInfo(createDate: $createDate, code: $code, name: $name, firstLayer: $firstLayer, secondLayer: $secondLayer, thirdLayer: $thirdLayer, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PowerInfoImpl &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.firstLayer, firstLayer) ||
                other.firstLayer == firstLayer) &&
            (identical(other.secondLayer, secondLayer) ||
                other.secondLayer == secondLayer) &&
            (identical(other.thirdLayer, thirdLayer) ||
                other.thirdLayer == thirdLayer) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, createDate, code, name,
      firstLayer, secondLayer, thirdLayer, description);

  /// Create a copy of PowerInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PowerInfoImplCopyWith<_$PowerInfoImpl> get copyWith =>
      __$$PowerInfoImplCopyWithImpl<_$PowerInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PowerInfoImplToJson(
      this,
    );
  }
}

abstract class _PowerInfo implements PowerInfo {
  factory _PowerInfo(
          {@JsonKey(name: 'createDate') final String createDate,
          @JsonKey(name: 'code') final String code,
          @JsonKey(name: 'name') final String name,
          @JsonKey(name: 'firstLayer') final double firstLayer,
          @JsonKey(name: 'secondLayer') final double secondLayer,
          @JsonKey(name: 'thirdLayer') final double thirdLayer,
          @JsonKey(name: 'description') final String description}) =
      _$PowerInfoImpl;

  factory _PowerInfo.fromJson(Map<String, dynamic> json) =
      _$PowerInfoImpl.fromJson;

  @override
  @JsonKey(name: 'createDate')
  String get createDate;
  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'firstLayer')
  double get firstLayer;
  @override
  @JsonKey(name: 'secondLayer')
  double get secondLayer;
  @override
  @JsonKey(name: 'thirdLayer')
  double get thirdLayer;
  @override
  @JsonKey(name: 'description')
  String get description;

  /// Create a copy of PowerInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PowerInfoImplCopyWith<_$PowerInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
