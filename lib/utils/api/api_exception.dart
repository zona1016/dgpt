import 'package:aida/utils/api/base_response.dart';

class ApiUnknownException implements Exception {}

class TimeOutException implements Exception {}

class CancelExecption implements Exception {}

class NoInternetException implements Exception {}

class ServerResponseException implements Exception {
  final BaseResponse response;
  ServerResponseException(this.response);
}
