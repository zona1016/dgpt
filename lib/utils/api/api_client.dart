import 'dart:convert';

import 'package:dgpt/utils/api/api_exception.dart';
import 'package:dgpt/utils/api/base_response.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

enum HttpMethod {
  post,
  get,
  put,
  patch,
  delete,
}

abstract class ApiClient {
  Future<BaseResponse<T>> request<T>(String path,
      {HttpMethod method = HttpMethod.post,
        Map<String, dynamic> data = const {},
        Map<String, dynamic> headers = const {},
        CancelToken? cancelToken,
        String? bearerToken,
        bool containsMultipartFile = false,
        required T Function(dynamic data) deserializer});
}

class ApiClientImpl implements ApiClient {
  final String baseUrl;
  final Dio dio = Dio();

  ApiClientImpl({required this.baseUrl}) {
    final options = BaseOptions(
      baseUrl: dio.options.baseUrl = baseUrl,
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 60000),
      sendTimeout: const Duration(milliseconds: 60000),
    );
    dio.options = options;
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true));
  }

  @override
  Future<BaseResponse<T>> request<T>(String path,
      {HttpMethod method = HttpMethod.post,
        Map<String, dynamic> data = const {},
        Map<String, dynamic> headers = const {},
        CancelToken? cancelToken,
        String? bearerToken,
        bool containsMultipartFile = false,
        required T Function(dynamic data) deserializer}) async {
    try {
      if (headers.isEmpty) {
        headers = {};
      }
      if (bearerToken != null) {
        if (bearerToken.isNotEmpty) {
          headers['Authorization'] = 'Bearer $bearerToken';
        }
      }
      if (data.isEmpty) {
        data = {};
      }
      // headers['X-API-KEY'] = AppConfigurations.apiKey;
      headers['Accept'] = 'application/json';
      headers['Accept-Language'] =
          Get.find<UserController>().selectedLanguage.apiKey;

      if (data.values.any((element) =>
      element is MultipartFile || element is List<MultipartFile>)) {
        containsMultipartFile = true;
      }

      Response response;
      response = await dio.request(path,
          data: containsMultipartFile
              ? FormData.fromMap(data, ListFormat.multiCompatible)
              : data,
          cancelToken: cancelToken,
          options: Options(
            method: method.name,
            headers: headers,
          ));
      final responseData = response.data.runtimeType == String
          ? jsonDecode(response.data)
          : response.data;
      final baseResponse =
      BaseResponse.fromMap(responseData, deserializer: deserializer);
      if (baseResponse.isSuccess) {
        return baseResponse;
      } else {
        throw ServerResponseException(baseResponse);
      }
    } on DioException catch (e) {
      debugPrint('Exception details: ${e.toString()}');
      switch (e.type) {
        case DioExceptionType.badResponse:
          try {
            final response = BaseResponse.fromMap(e.response?.data);
            throw ServerResponseException(response);
          } catch (_) {
            throw ServerResponseException(BaseResponse(
                code: e.response?.statusCode ?? 400,
                msg: e.response?.data['msg'] ?? ''));
          }
        case DioExceptionType.cancel:
          throw CancelExecption();
        case DioExceptionType.unknown:
        case DioExceptionType.badCertificate:
          break;

        case DioExceptionType.connectionError:
          throw NoInternetException();
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          throw TimeOutException();
      }
      throw ApiUnknownException();
    } catch (e, s) {
      if (e is ServerResponseException) {
        throw ServerResponseException(e.response);
      } else {
        debugPrint('Exception details: ${e.toString()}');
        debugPrint('Stack Trace: ${s.toString()}');
        throw ApiUnknownException();
      }
    }
  }
}
