import 'package:flutter/widgets.dart';

class BaseResponse<T> {
  final int code;
  final String error;
  final T? data;
  BaseResponse({required this.code, required this.error, this.data});

  BaseResponse<T> copyWith({int? code, String? error, T? data}) {
    return BaseResponse<T>(code: this.code, error: this.error, data: this.data);
  }

  bool get isSuccess => code == 200;

  factory BaseResponse.fromMap(Map<String, dynamic> map,
      {T Function(dynamic data)? deserializer}) {
    final results = map['results'];
    debugPrint(results.runtimeType.toString());
    final data = deserializer != null
        ? results.runtimeType == String && (results as String).isEmpty
        ? null
        : deserializer(results as dynamic)
        : null;
    return BaseResponse<T>(
        code: map['code'] as int,
        error: map['errors'] is Map
            ? (map['errors'] as Map<String, dynamic>).values.first[0] as String
            : map['errors'] as String,
        data: data);
  }
}
