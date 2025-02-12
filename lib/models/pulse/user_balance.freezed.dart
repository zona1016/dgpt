// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserBalance _$UserBalanceFromJson(Map<String, dynamic> json) {
  return _UserBalance.fromJson(json);
}

/// @nodoc
mixin _$UserBalance {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  int get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance')
  double get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'lockBalance')
  double get lockBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency')
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this UserBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBalanceCopyWith<UserBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBalanceCopyWith<$Res> {
  factory $UserBalanceCopyWith(
          UserBalance value, $Res Function(UserBalance) then) =
      _$UserBalanceCopyWithImpl<$Res, UserBalance>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') int type,
      @JsonKey(name: 'balance') double balance,
      @JsonKey(name: 'lockBalance') double lockBalance,
      @JsonKey(name: 'currency') String currency});
}

/// @nodoc
class _$UserBalanceCopyWithImpl<$Res, $Val extends UserBalance>
    implements $UserBalanceCopyWith<$Res> {
  _$UserBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? balance = null,
    Object? lockBalance = null,
    Object? currency = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      lockBalance: null == lockBalance
          ? _value.lockBalance
          : lockBalance // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBalanceImplCopyWith<$Res>
    implements $UserBalanceCopyWith<$Res> {
  factory _$$UserBalanceImplCopyWith(
          _$UserBalanceImpl value, $Res Function(_$UserBalanceImpl) then) =
      __$$UserBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') int type,
      @JsonKey(name: 'balance') double balance,
      @JsonKey(name: 'lockBalance') double lockBalance,
      @JsonKey(name: 'currency') String currency});
}

/// @nodoc
class __$$UserBalanceImplCopyWithImpl<$Res>
    extends _$UserBalanceCopyWithImpl<$Res, _$UserBalanceImpl>
    implements _$$UserBalanceImplCopyWith<$Res> {
  __$$UserBalanceImplCopyWithImpl(
      _$UserBalanceImpl _value, $Res Function(_$UserBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? balance = null,
    Object? lockBalance = null,
    Object? currency = null,
  }) {
    return _then(_$UserBalanceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      lockBalance: null == lockBalance
          ? _value.lockBalance
          : lockBalance // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBalanceImpl implements _UserBalance {
  _$UserBalanceImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'type') this.type = 0,
      @JsonKey(name: 'balance') this.balance = 0,
      @JsonKey(name: 'lockBalance') this.lockBalance = 0,
      @JsonKey(name: 'currency') this.currency = ''});

  factory _$UserBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBalanceImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'type')
  final int type;
  @override
  @JsonKey(name: 'balance')
  final double balance;
  @override
  @JsonKey(name: 'lockBalance')
  final double lockBalance;
  @override
  @JsonKey(name: 'currency')
  final String currency;

  @override
  String toString() {
    return 'UserBalance(id: $id, type: $type, balance: $balance, lockBalance: $lockBalance, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBalanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.lockBalance, lockBalance) ||
                other.lockBalance == lockBalance) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, balance, lockBalance, currency);

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBalanceImplCopyWith<_$UserBalanceImpl> get copyWith =>
      __$$UserBalanceImplCopyWithImpl<_$UserBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBalanceImplToJson(
      this,
    );
  }
}

abstract class _UserBalance implements UserBalance {
  factory _UserBalance(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'type') final int type,
      @JsonKey(name: 'balance') final double balance,
      @JsonKey(name: 'lockBalance') final double lockBalance,
      @JsonKey(name: 'currency') final String currency}) = _$UserBalanceImpl;

  factory _UserBalance.fromJson(Map<String, dynamic> json) =
      _$UserBalanceImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'type')
  int get type;
  @override
  @JsonKey(name: 'balance')
  double get balance;
  @override
  @JsonKey(name: 'lockBalance')
  double get lockBalance;
  @override
  @JsonKey(name: 'currency')
  String get currency;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBalanceImplCopyWith<_$UserBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
