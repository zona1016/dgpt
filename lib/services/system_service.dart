
import 'package:dgpt/utils/api/api_client.dart';
import 'package:dgpt/utils/api/base_response.dart';
import 'package:dgpt/utils/constants/api_endpoints.dart';
import 'package:get/get.dart';

abstract class SystemService {
  Future<BaseResponse> checkForceUpdate();
}

class SystemServiceImpl extends SystemService {
  final ApiClient _apiClient = Get.find();
  @override
  Future<BaseResponse> checkForceUpdate() async {
    try {
      return await _apiClient.request(ApiEndpoints.checkForceUpdate,
          method: HttpMethod.get,
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
