import 'package:freezed_annotation/freezed_annotation.dart';

class IntegerConverter implements JsonConverter<int, dynamic> {
  const IntegerConverter();

  @override
  int fromJson(dynamic json) {
    if (json != null) {
      if (json is String) {
        return int.tryParse(json) ?? 0;
      } else if (json is int) {
        return json;
      } else if (json is double) {
        return json.toInt();
      }
    }
    return 0;
  }

  @override
  String toJson(int object) => object.toString();
}
