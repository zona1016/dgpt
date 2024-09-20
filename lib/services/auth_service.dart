
import 'package:aida/models/auth/login_response.dart';
import 'package:aida/utils/api/api_client.dart';
import 'package:aida/utils/api/base_response.dart';
import 'package:aida/utils/constants/api_endpoints.dart';
import 'package:aida/utils/controllers/user_controller.dart';
import 'package:get/get.dart';

abstract class AuthService {
  Future<BaseResponse<LoginResponse?>> login(
      {required String username, required String password});
  Future<BaseResponse<bool?>> logout();
  Future<BaseResponse<LoginResponse?>> register(
      {required String nickname,
        required String username,
        required String password,
        required String confirmPassword,
        required String email,
        required String emailCode,
        String? refCode});
  Future<BaseResponse<int?>> resetPassword(
      {required String email,
        required String emailCode,
        required String password,
        required String confirmPassword});
}

class AuthServiceImpl extends AuthService {
  final ApiClient _apiClient = Get.find();
  final UserController userController = Get.find();

  @override
  Future<BaseResponse<LoginResponse?>> login(
      {required String username, required String password}) async {
    try {
      return await _apiClient.request(ApiEndpoints.login,
          data: {
            'username': username,
            'password': password,
          },
          deserializer: (data) =>
          data != null ? LoginResponse.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<LoginResponse?>> register(
      {required String nickname,
        required String username,
        required String password,
        required String confirmPassword,
        required String email,
        required String emailCode,
        String? refCode}) async {
    try {
      return await _apiClient.request(ApiEndpoints.register,
          data: {
            'nickname': nickname,
            'username': username,
            'password': password,
            'password_confirmation': confirmPassword,
            'email': email,
            'email_vcode': emailCode,
            'ref_code': refCode
          },
          deserializer: (data) =>
          data != null ? LoginResponse.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<int?>> resetPassword(
      {required String email,
        required String emailCode,
        required String password,
        required String confirmPassword}) async {
    try {
      return await _apiClient.request(ApiEndpoints.resetPassword,
          data: {
            'email': email,
            'password': password,
            'password_confirmation': confirmPassword,
            'otp': emailCode
          },
          deserializer: (data) => int.tryParse(data.toString()));
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<bool?>> logout() async {
    try {
      return await _apiClient.request(ApiEndpoints.logout,
          bearerToken: userController.token,
          deserializer: (data) => data != null);
    } on Exception catch (_) {
      rethrow;
    }
  }

}
