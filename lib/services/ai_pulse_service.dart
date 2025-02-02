import 'package:dgpt/models/api/pagination_response.dart';
import 'package:dgpt/models/pulse/banner.dart';
import 'package:dgpt/models/pulse/deposit.dart';
import 'package:dgpt/models/pulse/hashrate_page_detail.dart';
import 'package:dgpt/models/pulse/hashrate_page_info.dart';
import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/utils/api/api_client.dart';
import 'package:dgpt/utils/api/base_response.dart';
import 'package:dgpt/utils/constants/api_endpoints.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:get/get.dart';

abstract class AiPulseService {
  Future<BaseResponse<PaginationResponse<Banner>?>> aiPulseBanner(
      {int page, int perPage});

  Future<BaseResponse<PaginationResponse<Deposit>?>> aiPulseDeposit(
      {int page, int perPage});

  Future<BaseResponse<PowerInfo?>> userHashrate();

  Future<BaseResponse<HashratePageDetail?>> hashratePageDetail(
      {required String id});

  Future<BaseResponse<PaginationResponse<HasratePageInfo>?>> hashratePage(
      {int page = 1, int perPage = 20});

  Future<BaseResponse> registerVerifyCode();
}

class AiPulseServiceImpl extends AiPulseService {
  final ApiClient _apiClient = Get.find();
  final UserController userController = Get.find();

  @override
  Future<BaseResponse<PaginationResponse<Banner>?>> aiPulseBanner(
      {int page = 1, int perPage = 20}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseBanner,
          bearerToken: userController.token,
          data: {
            'page': page,
            'pageSize': perPage,
          },
          deserializer: (data) => data != null
              ? PaginationResponse<Banner>.fromJson(
                  data, (json) => Banner.fromJson(json as Map<String, dynamic>))
              : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<PaginationResponse<Deposit>?>> aiPulseDeposit(
      {int page = 1, int perPage = 20}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseDeposit,
          bearerToken: userController.token,
          data: {
            'page': page,
            'pageSize': perPage,
          },
          deserializer: (data) => data != null
              ? PaginationResponse<Deposit>.fromJson(data,
                  (json) => Deposit.fromJson(json as Map<String, dynamic>))
              : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<PowerInfo?>> userHashrate() async {
    try {
      return await _apiClient.request(ApiEndpoints.userHashrate,
          bearerToken: userController.token,
          deserializer: (data) =>
              data != null ? PowerInfo.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> registerVerifyCode() async {
    try {
      return await _apiClient.request(ApiEndpoints.registerVerifyCode,
          bearerToken: userController.token, deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<HashratePageDetail?>> hashratePageDetail(
      {required String id}) async {
    try {
      return await _apiClient.request(ApiEndpoints.hashratePageDetail,
          method: HttpMethod.get,
          bearerToken: userController.token,
          data: {'id': id},
          deserializer: (data) =>
              data != null ? HashratePageDetail.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<PaginationResponse<HasratePageInfo>?>> hashratePage(
      {int page = 1, int perPage = 20}) async {
    try {
      return await _apiClient.request(ApiEndpoints.hashratePage,
          bearerToken: userController.token,
          data: {
            'page': page,
            'pageSize': perPage,
          },
          deserializer: (data) => data != null
              ? PaginationResponse<HasratePageInfo>.fromJson(
                  data,
                  (json) =>
                      HasratePageInfo.fromJson(json as Map<String, dynamic>))
              : null);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
