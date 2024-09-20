import 'package:freezed_annotation/freezed_annotation.dart';

class DoubleConverter implements JsonConverter<double, dynamic> {
  const DoubleConverter();

  @override
  double fromJson(dynamic json) {
    if (json != null) {
      if (json is String) {
        return double.parse(json);
      } else if (json is int) {
        return json.toDouble();
      } else if (json is double) {
        return json;
      }
    }
    return 0;
  }

  @override
  String toJson(double object) => object.toString();
}
