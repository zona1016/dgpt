
import 'package:dgpt/utils/converters/boolean_converter.dart';
import 'package:dgpt/utils/converters/integer_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_update_info.freezed.dart';
part 'app_update_info.g.dart';

@freezed
class AppUpdateInfo with _$AppUpdateInfo {
  factory AppUpdateInfo({
    @JsonKey(name: "ios_version") @Default(0) @IntegerConverter() int iosVersion,
    @JsonKey(name: "android_version") @Default(0) @IntegerConverter() int androidVersion,
    @Default(false) @BooleanConverter() bool force,
    @Default(false) @BooleanConverter() bool popup,
  }) = _AppUpdateInfo;

  factory AppUpdateInfo.fromJson(Map<String, dynamic> json) =>
      _$AppUpdateInfoFromJson(json);
}
