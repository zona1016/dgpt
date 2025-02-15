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

  Future<BaseResponse<LoginResponse?>> register(
      {String? account,
      required String email,
      required String verifyCodeId,
      required String verifyCode,
      String? phoneNation,
      String? phone,
      required String password,
      required String confirmPassword,
      String? inviteCode});

  Future<BaseResponse<int?>> changePwd(
      {required String passwordOld, required String passwordNew});
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
      return await _apiClient.request(ApiEndpoints.userLogin,
          data: {
            'account': account,
            'password': password,
            if (codeId != null) 'codeId': codeId,
            if (code != null) 'code': code
          },
          deserializer: (data) =>
              data != null ? LoginResponse.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<LoginResponse?>> register(
      {String? account,
      required String email,
      required String verifyCodeId,
      required String verifyCode,
      String? phoneNation,
      String? phone,
      required String password,
      required String confirmPassword,
      String? inviteCode}) async {
    try {
      return await _apiClient.request(ApiEndpoints.userRegister,
          data: {
            if (account != null) 'account': account,
            'email': email,
            if (phoneNation != null) 'phoneNation': phoneNation,
            if (phone != null) 'phone': phone,
            'password': password,
            'verifyCodeId': verifyCodeId,
            'verifyCode': verifyCode,
            'inviteCode': inviteCode
          },
          deserializer: (data) =>
          data != null ? LoginResponse.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<int?>> changePwd(
      {required String passwordOld, required String passwordNew}) async {
    try {
      return await _apiClient.request(ApiEndpoints.changePwd,
          bearerToken: userController.token,
          data: {'passwordOld': passwordOld, 'passwordNew': passwordNew},
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
