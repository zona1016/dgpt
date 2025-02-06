// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_income_total.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserIncomeTotal _$UserIncomeTotalFromJson(Map<String, dynamic> json) {
  return _UserIncomeTotal.fromJson(json);
}

/// @nodoc
mixin _$UserIncomeTotal {
  @JsonKey(name: 'today')
  double get today => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  double get total => throw _privateConstructorUsedError;

  /// Serializes this UserIncomeTotal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserIncomeTotal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserIncomeTotalCopyWith<UserIncomeTotal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserIncomeTotalCopyWith<$Res> {
  factory $UserIncomeTotalCopyWith(
          UserIncomeTotal value, $Res Function(UserIncomeTotal) then) =
      _$UserIncomeTotalCopyWithImpl<$Res, UserIncomeTotal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'today') double today,
      @JsonKey(name: 'total') double total});
}

/// @nodoc
class _$UserIncomeTotalCopyWithImpl<$Res, $Val extends UserIncomeTotal>
    implements $UserIncomeTotalCopyWith<$Res> {
  _$UserIncomeTotalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserIncomeTotal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserIncomeTotalImplCopyWith<$Res>
    implements $UserIncomeTotalCopyWith<$Res> {
  factory _$$UserIncomeTotalImplCopyWith(_$UserIncomeTotalImpl value,
          $Res Function(_$UserIncomeTotalImpl) then) =
      __$$UserIncomeTotalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'today') double today,
      @JsonKey(name: 'total') double total});
}

/// @nodoc
class __$$UserIncomeTotalImplCopyWithImpl<$Res>
    extends _$UserIncomeTotalCopyWithImpl<$Res, _$UserIncomeTotalImpl>
    implements _$$UserIncomeTotalImplCopyWith<$Res> {
  __$$UserIncomeTotalImplCopyWithImpl(
      _$UserIncomeTotalImpl _value, $Res Function(_$UserIncomeTotalImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserIncomeTotal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? today = null,
    Object? total = null,
  }) {
    return _then(_$UserIncomeTotalImpl(
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserIncomeTotalImpl implements _UserIncomeTotal {
  _$UserIncomeTotalImpl(
      {@JsonKey(name: 'today') this.today = 0,
      @JsonKey(name: 'total') this.total = 0});

  factory _$UserIncomeTotalImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserIncomeTotalImplFromJson(json);

  @override
  @JsonKey(name: 'today')
  final double today;
  @override
  @JsonKey(name: 'total')
  final double total;

  @override
  String toString() {
    return 'UserIncomeTotal(today: $today, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserIncomeTotalImpl &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, today, total);

  /// Create a copy of UserIncomeTotal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserIncomeTotalImplCopyWith<_$UserIncomeTotalImpl> get copyWith =>
      __$$UserIncomeTotalImplCopyWithImpl<_$UserIncomeTotalImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserIncomeTotalImplToJson(
      this,
    );
  }
}

abstract class _UserIncomeTotal implements UserIncomeTotal {
  factory _UserIncomeTotal(
      {@JsonKey(name: 'today') final double today,
      @JsonKey(name: 'total') final double total}) = _$UserIncomeTotalImpl;

  factory _UserIncomeTotal.fromJson(Map<String, dynamic> json) =
      _$UserIncomeTotalImpl.fromJson;

  @override
  @JsonKey(name: 'today')
  double get today;
  @override
  @JsonKey(name: 'total')
  double get total;

  /// Create a copy of UserIncomeTotal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserIncomeTotalImplCopyWith<_$UserIncomeTotalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
