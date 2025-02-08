// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_kyc_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserKYCInfo _$UserKYCInfoFromJson(Map<String, dynamic> json) {
  return _UserKYCInfo.fromJson(json);
}

/// @nodoc
mixin _$UserKYCInfo {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError; // 默认值为 0
  @JsonKey(name: 'realName')
  String get realName => throw _privateConstructorUsedError; // 默认值为空字符串
  @JsonKey(name: 'idType')
  int get idType => throw _privateConstructorUsedError; // 默认值为 0
  @JsonKey(name: 'idValue')
  String get idValue => throw _privateConstructorUsedError; // 默认值为空字符串
  @JsonKey(name: 'imageFileIdUrl')
  String get imageFileIdUrl => throw _privateConstructorUsedError; // 默认值为空字符串
  @JsonKey(name: 'imageFileId')
  int get imageFileId => throw _privateConstructorUsedError; // 默认值为 0
  @JsonKey(name: 'status')
  int get status => throw _privateConstructorUsedError; // 默认值为 0
  @JsonKey(name: 'auditDate')
  String get auditDate => throw _privateConstructorUsedError; // 默认值为空字符串
  @JsonKey(name: 'auditResult')
  String get auditResult => throw _privateConstructorUsedError; // 默认值为空字符串
  @JsonKey(name: 'country')
  String get country => throw _privateConstructorUsedError;

  /// Serializes this UserKYCInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserKYCInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserKYCInfoCopyWith<UserKYCInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserKYCInfoCopyWith<$Res> {
  factory $UserKYCInfoCopyWith(
          UserKYCInfo value, $Res Function(UserKYCInfo) then) =
      _$UserKYCInfoCopyWithImpl<$Res, UserKYCInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'realName') String realName,
      @JsonKey(name: 'idType') int idType,
      @JsonKey(name: 'idValue') String idValue,
      @JsonKey(name: 'imageFileIdUrl') String imageFileIdUrl,
      @JsonKey(name: 'imageFileId') int imageFileId,
      @JsonKey(name: 'status') int status,
      @JsonKey(name: 'auditDate') String auditDate,
      @JsonKey(name: 'auditResult') String auditResult,
      @JsonKey(name: 'country') String country});
}

/// @nodoc
class _$UserKYCInfoCopyWithImpl<$Res, $Val extends UserKYCInfo>
    implements $UserKYCInfoCopyWith<$Res> {
  _$UserKYCInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserKYCInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? realName = null,
    Object? idType = null,
    Object? idValue = null,
    Object? imageFileIdUrl = null,
    Object? imageFileId = null,
    Object? status = null,
    Object? auditDate = null,
    Object? auditResult = null,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      realName: null == realName
          ? _value.realName
          : realName // ignore: cast_nullable_to_non_nullable
              as String,
      idType: null == idType
          ? _value.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as int,
      idValue: null == idValue
          ? _value.idValue
          : idValue // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileIdUrl: null == imageFileIdUrl
          ? _value.imageFileIdUrl
          : imageFileIdUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileId: null == imageFileId
          ? _value.imageFileId
          : imageFileId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      auditDate: null == auditDate
          ? _value.auditDate
          : auditDate // ignore: cast_nullable_to_non_nullable
              as String,
      auditResult: null == auditResult
          ? _value.auditResult
          : auditResult // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserKYCInfoImplCopyWith<$Res>
    implements $UserKYCInfoCopyWith<$Res> {
  factory _$$UserKYCInfoImplCopyWith(
          _$UserKYCInfoImpl value, $Res Function(_$UserKYCInfoImpl) then) =
      __$$UserKYCInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'realName') String realName,
      @JsonKey(name: 'idType') int idType,
      @JsonKey(name: 'idValue') String idValue,
      @JsonKey(name: 'imageFileIdUrl') String imageFileIdUrl,
      @JsonKey(name: 'imageFileId') int imageFileId,
      @JsonKey(name: 'status') int status,
      @JsonKey(name: 'auditDate') String auditDate,
      @JsonKey(name: 'auditResult') String auditResult,
      @JsonKey(name: 'country') String country});
}

/// @nodoc
class __$$UserKYCInfoImplCopyWithImpl<$Res>
    extends _$UserKYCInfoCopyWithImpl<$Res, _$UserKYCInfoImpl>
    implements _$$UserKYCInfoImplCopyWith<$Res> {
  __$$UserKYCInfoImplCopyWithImpl(
      _$UserKYCInfoImpl _value, $Res Function(_$UserKYCInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserKYCInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? realName = null,
    Object? idType = null,
    Object? idValue = null,
    Object? imageFileIdUrl = null,
    Object? imageFileId = null,
    Object? status = null,
    Object? auditDate = null,
    Object? auditResult = null,
    Object? country = null,
  }) {
    return _then(_$UserKYCInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      realName: null == realName
          ? _value.realName
          : realName // ignore: cast_nullable_to_non_nullable
              as String,
      idType: null == idType
          ? _value.idType
          : idType // ignore: cast_nullable_to_non_nullable
              as int,
      idValue: null == idValue
          ? _value.idValue
          : idValue // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileIdUrl: null == imageFileIdUrl
          ? _value.imageFileIdUrl
          : imageFileIdUrl // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileId: null == imageFileId
          ? _value.imageFileId
          : imageFileId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      auditDate: null == auditDate
          ? _value.auditDate
          : auditDate // ignore: cast_nullable_to_non_nullable
              as String,
      auditResult: null == auditResult
          ? _value.auditResult
          : auditResult // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserKYCInfoImpl implements _UserKYCInfo {
  _$UserKYCInfoImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'realName') this.realName = '',
      @JsonKey(name: 'idType') this.idType = 0,
      @JsonKey(name: 'idValue') this.idValue = '',
      @JsonKey(name: 'imageFileIdUrl') this.imageFileIdUrl = '',
      @JsonKey(name: 'imageFileId') this.imageFileId = 0,
      @JsonKey(name: 'status') this.status = 0,
      @JsonKey(name: 'auditDate') this.auditDate = '',
      @JsonKey(name: 'auditResult') this.auditResult = '',
      @JsonKey(name: 'country') this.country = ''});

  factory _$UserKYCInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserKYCInfoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
// 默认值为 0
  @override
  @JsonKey(name: 'realName')
  final String realName;
// 默认值为空字符串
  @override
  @JsonKey(name: 'idType')
  final int idType;
// 默认值为 0
  @override
  @JsonKey(name: 'idValue')
  final String idValue;
// 默认值为空字符串
  @override
  @JsonKey(name: 'imageFileIdUrl')
  final String imageFileIdUrl;
// 默认值为空字符串
  @override
  @JsonKey(name: 'imageFileId')
  final int imageFileId;
// 默认值为 0
  @override
  @JsonKey(name: 'status')
  final int status;
// 默认值为 0
  @override
  @JsonKey(name: 'auditDate')
  final String auditDate;
// 默认值为空字符串
  @override
  @JsonKey(name: 'auditResult')
  final String auditResult;
// 默认值为空字符串
  @override
  @JsonKey(name: 'country')
  final String country;

  @override
  String toString() {
    return 'UserKYCInfo(id: $id, realName: $realName, idType: $idType, idValue: $idValue, imageFileIdUrl: $imageFileIdUrl, imageFileId: $imageFileId, status: $status, auditDate: $auditDate, auditResult: $auditResult, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserKYCInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.realName, realName) ||
                other.realName == realName) &&
            (identical(other.idType, idType) || other.idType == idType) &&
            (identical(other.idValue, idValue) || other.idValue == idValue) &&
            (identical(other.imageFileIdUrl, imageFileIdUrl) ||
                other.imageFileIdUrl == imageFileIdUrl) &&
            (identical(other.imageFileId, imageFileId) ||
                other.imageFileId == imageFileId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.auditDate, auditDate) ||
                other.auditDate == auditDate) &&
            (identical(other.auditResult, auditResult) ||
                other.auditResult == auditResult) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, realName, idType, idValue,
      imageFileIdUrl, imageFileId, status, auditDate, auditResult, country);

  /// Create a copy of UserKYCInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserKYCInfoImplCopyWith<_$UserKYCInfoImpl> get copyWith =>
      __$$UserKYCInfoImplCopyWithImpl<_$UserKYCInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserKYCInfoImplToJson(
      this,
    );
  }
}

abstract class _UserKYCInfo implements UserKYCInfo {
  factory _UserKYCInfo(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'realName') final String realName,
      @JsonKey(name: 'idType') final int idType,
      @JsonKey(name: 'idValue') final String idValue,
      @JsonKey(name: 'imageFileIdUrl') final String imageFileIdUrl,
      @JsonKey(name: 'imageFileId') final int imageFileId,
      @JsonKey(name: 'status') final int status,
      @JsonKey(name: 'auditDate') final String auditDate,
      @JsonKey(name: 'auditResult') final String auditResult,
      @JsonKey(name: 'country') final String country}) = _$UserKYCInfoImpl;

  factory _UserKYCInfo.fromJson(Map<String, dynamic> json) =
      _$UserKYCInfoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id; // 默认值为 0
  @override
  @JsonKey(name: 'realName')
  String get realName; // 默认值为空字符串
  @override
  @JsonKey(name: 'idType')
  int get idType; // 默认值为 0
  @override
  @JsonKey(name: 'idValue')
  String get idValue; // 默认值为空字符串
  @override
  @JsonKey(name: 'imageFileIdUrl')
  String get imageFileIdUrl; // 默认值为空字符串
  @override
  @JsonKey(name: 'imageFileId')
  int get imageFileId; // 默认值为 0
  @override
  @JsonKey(name: 'status')
  int get status; // 默认值为 0
  @override
  @JsonKey(name: 'auditDate')
  String get auditDate; // 默认值为空字符串
  @override
  @JsonKey(name: 'auditResult')
  String get auditResult; // 默认值为空字符串
  @override
  @JsonKey(name: 'country')
  String get country;

  /// Create a copy of UserKYCInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserKYCInfoImplCopyWith<_$UserKYCInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
