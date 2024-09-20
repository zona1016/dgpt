import 'package:freezed_annotation/freezed_annotation.dart';

class BooleanConverter implements JsonConverter<bool, dynamic> {
  const BooleanConverter();

  @override
  bool fromJson(dynamic json) {
    if (json != null) {
      if (json is String) {
        return json == '1' || json == 'yes';
      } else if (json is int) {
        return json == 1;
      }
    }
    return false;
  }

  @override
  int toJson(bool object) => object ? 1 : 0;
}
