import 'package:flutter/widgets.dart';

class BaseResponse<T> {
  final int code;
  final String msg;
  final T? data;
  BaseResponse({required this.code, required this.msg, this.data});

  BaseResponse<T> copyWith({int? code, String? error, T? data}) {
    return BaseResponse<T>(code: this.code, msg: this.msg, data: this.data);
  }

  bool get isSuccess => code == 200;

  factory BaseResponse.fromMap(Map<String, dynamic> map,
      {T Function(dynamic data)? deserializer}) {
    final results = map['result'];
    debugPrint(results.runtimeType.toString());
    final data = deserializer != null
        ? results.runtimeType == String && (results as String).isEmpty
        ? null
        : deserializer(results as dynamic)
        : null;
    return BaseResponse<T>(
        code: map['code'] as int,
        msg: map['message'] is Map
            ? (map['message'] as Map<String, dynamic>).values.first[0] as String
            : map['message'] as String,
        data: data);
  }
}
