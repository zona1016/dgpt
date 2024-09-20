import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime?, String> {
  const DateTimeConverter();

  @override
  DateTime? fromJson(String json) {
    return DateTime.tryParse(json);
  }

  @override
  String toJson(DateTime? json) => json == null ? "" : json.toIso8601String();
}
