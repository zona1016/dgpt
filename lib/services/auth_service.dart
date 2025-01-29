import 'package:dgpt/models/auth/login_response.dart';
import 'package:dgpt/utils/api/api_client.dart';
import 'package:dgpt/utils/api/base_response.dart';
import 'package:dgpt/utils/constants/api_endpoints.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:get/get.dart';

abstract class AuthService {
  Future<BaseResponse<LoginResponse?>> login(
      {required String account,
      required String password,
      String? tenantId,
      String? codeId,
      String? code});

  Future<BaseResponse<bool?>> logout();

  Future<BaseResponse<bool?>> register(
      {required String account,
      required String email,
      required String phoneNation,
      required String phone,
      required String password,
      required String confirmPassword,
      String? inviteCode});

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
      {required String account,
        required String password,
        String? tenantId,
        String? codeId,
        String? code}) async {
    try {
      return await _apiClient.request(ApiEndpoints.login,
          data: {
            'account': account,
            'password': password,
            if (codeId != null)
              'codeId': codeId,
            if (code != null)
              'code': code
          },
          deserializer: (data) =>
              data != null ? LoginResponse.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<bool?>> register(
      {required String account,
      required String email,
      required String phoneNation,
      required String phone,
      required String password,
      required String confirmPassword,
      String? inviteCode}) async {
    try {
      return await _apiClient.request(ApiEndpoints.register,
          data: {
            'account': account,
            'email': email,
            'phoneNation': phoneNation,
            'phone': phone,
            'password': password,
            'confirmPassword': confirmPassword,
            'inviteCode': inviteCode
          },
          deserializer: (data) => data != null);
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
