import 'package:dgpt/models/user/user_info.dart';
import 'package:dgpt/utils/api/api_client.dart';
import 'package:dgpt/utils/api/base_response.dart';
import 'package:dgpt/utils/constants/api_endpoints.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:get/get.dart';

abstract class UserService {

  Future<BaseResponse<UserInfo?>> getUserInfo(String token);
}

class UserServiceImpl extends UserService {
  final ApiClient _apiClient = Get.find();
  final UserController userController = Get.find();

  @override
  Future<BaseResponse<UserInfo?>> getUserInfo(String token) async {
    try {
      return await _apiClient.request(ApiEndpoints.getUserInfo,
          bearerToken: token,
          method: HttpMethod.get,
          deserializer: (data) =>
          data != null ? UserInfo.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }
}