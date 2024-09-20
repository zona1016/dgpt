// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_update_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUpdateInfo _$AppUpdateInfoFromJson(Map<String, dynamic> json) {
  return _AppUpdateInfo.fromJson(json);
}

/// @nodoc
mixin _$AppUpdateInfo {
  @JsonKey(name: "ios_version")
  @IntegerConverter()
  int get iosVersion => throw _privateConstructorUsedError;
  @JsonKey(name: "android_version")
  @IntegerConverter()
  int get androidVersion => throw _privateConstructorUsedError;
  @BooleanConverter()
  bool get force => throw _privateConstructorUsedError;
  @BooleanConverter()
  bool get popup => throw _privateConstructorUsedError;

  /// Serializes this AppUpdateInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUpdateInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUpdateInfoCopyWith<AppUpdateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUpdateInfoCopyWith<$Res> {
  factory $AppUpdateInfoCopyWith(
          AppUpdateInfo value, $Res Function(AppUpdateInfo) then) =
      _$AppUpdateInfoCopyWithImpl<$Res, AppUpdateInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "ios_version") @IntegerConverter() int iosVersion,
      @JsonKey(name: "android_version") @IntegerConverter() int androidVersion,
      @BooleanConverter() bool force,
      @BooleanConverter() bool popup});
}

/// @nodoc
class _$AppUpdateInfoCopyWithImpl<$Res, $Val extends AppUpdateInfo>
    implements $AppUpdateInfoCopyWith<$Res> {
  _$AppUpdateInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUpdateInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iosVersion = null,
    Object? androidVersion = null,
    Object? force = null,
    Object? popup = null,
  }) {
    return _then(_value.copyWith(
      iosVersion: null == iosVersion
          ? _value.iosVersion
          : iosVersion // ignore: cast_nullable_to_non_nullable
              as int,
      androidVersion: null == androidVersion
          ? _value.androidVersion
          : androidVersion // ignore: cast_nullable_to_non_nullable
              as int,
      force: null == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool,
      popup: null == popup
          ? _value.popup
          : popup // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUpdateInfoImplCopyWith<$Res>
    implements $AppUpdateInfoCopyWith<$Res> {
  factory _$$AppUpdateInfoImplCopyWith(
          _$AppUpdateInfoImpl value, $Res Function(_$AppUpdateInfoImpl) then) =
      __$$AppUpdateInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "ios_version") @IntegerConverter() int iosVersion,
      @JsonKey(name: "android_version") @IntegerConverter() int androidVersion,
      @BooleanConverter() bool force,
      @BooleanConverter() bool popup});
}

/// @nodoc
class __$$AppUpdateInfoImplCopyWithImpl<$Res>
    extends _$AppUpdateInfoCopyWithImpl<$Res, _$AppUpdateInfoImpl>
    implements _$$AppUpdateInfoImplCopyWith<$Res> {
  __$$AppUpdateInfoImplCopyWithImpl(
      _$AppUpdateInfoImpl _value, $Res Function(_$AppUpdateInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUpdateInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iosVersion = null,
    Object? androidVersion = null,
    Object? force = null,
    Object? popup = null,
  }) {
    return _then(_$AppUpdateInfoImpl(
      iosVersion: null == iosVersion
          ? _value.iosVersion
          : iosVersion // ignore: cast_nullable_to_non_nullable
              as int,
      androidVersion: null == androidVersion
          ? _value.androidVersion
          : androidVersion // ignore: cast_nullable_to_non_nullable
              as int,
      force: null == force
          ? _value.force
          : force // ignore: cast_nullable_to_non_nullable
              as bool,
      popup: null == popup
          ? _value.popup
          : popup // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUpdateInfoImpl implements _AppUpdateInfo {
  _$AppUpdateInfoImpl(
      {@JsonKey(name: "ios_version") @IntegerConverter() this.iosVersion = 0,
      @JsonKey(name: "android_version")
      @IntegerConverter()
      this.androidVersion = 0,
      @BooleanConverter() this.force = false,
      @BooleanConverter() this.popup = false});

  factory _$AppUpdateInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUpdateInfoImplFromJson(json);

  @override
  @JsonKey(name: "ios_version")
  @IntegerConverter()
  final int iosVersion;
  @override
  @JsonKey(name: "android_version")
  @IntegerConverter()
  final int androidVersion;
  @override
  @JsonKey()
  @BooleanConverter()
  final bool force;
  @override
  @JsonKey()
  @BooleanConverter()
  final bool popup;

  @override
  String toString() {
    return 'AppUpdateInfo(iosVersion: $iosVersion, androidVersion: $androidVersion, force: $force, popup: $popup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUpdateInfoImpl &&
            (identical(other.iosVersion, iosVersion) ||
                other.iosVersion == iosVersion) &&
            (identical(other.androidVersion, androidVersion) ||
                other.androidVersion == androidVersion) &&
            (identical(other.force, force) || other.force == force) &&
            (identical(other.popup, popup) || other.popup == popup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, iosVersion, androidVersion, force, popup);

  /// Create a copy of AppUpdateInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUpdateInfoImplCopyWith<_$AppUpdateInfoImpl> get copyWith =>
      __$$AppUpdateInfoImplCopyWithImpl<_$AppUpdateInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUpdateInfoImplToJson(
      this,
    );
  }
}

abstract class _AppUpdateInfo implements AppUpdateInfo {
  factory _AppUpdateInfo(
      {@JsonKey(name: "ios_version") @IntegerConverter() final int iosVersion,
      @JsonKey(name: "android_version")
      @IntegerConverter()
      final int androidVersion,
      @BooleanConverter() final bool force,
      @BooleanConverter() final bool popup}) = _$AppUpdateInfoImpl;

  factory _AppUpdateInfo.fromJson(Map<String, dynamic> json) =
      _$AppUpdateInfoImpl.fromJson;

  @override
  @JsonKey(name: "ios_version")
  @IntegerConverter()
  int get iosVersion;
  @override
  @JsonKey(name: "android_version")
  @IntegerConverter()
  int get androidVersion;
  @override
  @BooleanConverter()
  bool get force;
  @override
  @BooleanConverter()
  bool get popup;

  /// Create a copy of AppUpdateInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUpdateInfoImplCopyWith<_$AppUpdateInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
