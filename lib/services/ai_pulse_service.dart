import 'package:dgpt/models/api/pagination_response.dart';
import 'package:dgpt/models/pulse/direct_top_info.dart';
import 'package:dgpt/models/pulse/enable_job_info.dart';
import 'package:dgpt/models/pulse/flow_info.dart';
import 'package:dgpt/models/pulse/flow_type_info.dart';
import 'package:dgpt/models/pulse/google_auth_info.dart';
import 'package:dgpt/models/pulse/layer_hashrate_info.dart';
import 'package:dgpt/models/pulse/layer_info.dart';
import 'package:dgpt/models/pulse/notice_info.dart';
import 'package:dgpt/models/pulse/ai_chat_message.dart';
import 'package:dgpt/models/pulse/ai_pulse_banner.dart';
import 'package:dgpt/models/pulse/amount_total_info.dart';
import 'package:dgpt/models/pulse/deposit.dart';
import 'package:dgpt/models/pulse/hasrate_progress_info.dart';
import 'package:dgpt/models/pulse/image_info.dart';
import 'package:dgpt/models/pulse/merchant.dart';
import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/models/pulse/salary_award.dart';
import 'package:dgpt/models/pulse/team_hashrate_count_total.dart';
import 'package:dgpt/models/pulse/team_member_list.dart';
import 'package:dgpt/models/pulse/user_balance.dart';
import 'package:dgpt/models/pulse/user_income_total.dart';
import 'package:dgpt/models/pulse/user_kyc_info.dart';
import 'package:dgpt/models/pulse/user_team_total_info.dart';
import 'package:dgpt/models/user/user_info.dart';
import 'package:dgpt/utils/api/api_client.dart';
import 'package:dgpt/utils/api/base_response.dart';
import 'package:dgpt/utils/constants/api_endpoints.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:get/get.dart';

abstract class AiPulseService {
  Future<BaseResponse<List<Banner>>> aiPulseBannerUserPage({int position = 0});

  Future<BaseResponse<PaginationResponse<Deposit>?>> aiPulseDeposit(
      {int page, int perPage});

  Future<BaseResponse<PowerInfo?>> userHashrate();

  Future<BaseResponse<HasrateProgressInfo?>> aiPulseUserHashrateProgress();

  Future<BaseResponse<PlanDetail?>> aiPulsePlanDetail({required String id});

  Future<BaseResponse<PaginationResponse<PlanDetail>?>> hashratePage(
      {int page = 1, int perPage = 20});

  Future<BaseResponse> registerVerifyCode();

  Future<BaseResponse<UserIncomeTotal?>> userIncomeTotal();

  Future<BaseResponse> aiPulseCommonRegisterVerifyCode({required String email});

  Future<BaseResponse> aiPulseUserPlanApply({
    required String id,
    required String quantity,
    required String code,
  });

  Future<BaseResponse<List<AiChatMessage>?>> aiPulseChatGptSend(
      {required String prompt});

  Future<BaseResponse<PaginationResponse<AiChatMessage>?>>
      aiPulseChatGptUserPage({int page = 1, int perPage = 20});

  Future<BaseResponse> aiPulseChatGptClearHistory();

  Future<BaseResponse> userHasTradingPwd();

  Future<BaseResponse<List<TeamMemberList>?>> userTeamMemberList();

  Future<BaseResponse<List<TeamHashrateCountTotal>?>>
      userTeamHashrateCountTotal();

  Future<BaseResponse<AmountTotalInfo?>> aiPulseTotalAmountTotal();

  Future<BaseResponse> userChangeTradingPwd(
      {required String passwordOld,
      required String passwordNew,
      String? verifyCodeId,
      String? verifyCode});

  Future<BaseResponse> userChangePwd(
      {required String passwordOld,
      required String passwordNew,
      String? verifyCodeId,
      String? verifyCode});

  Future<BaseResponse> userResetPwdSubmit(
      {required String passwordNew,
      required String verifyCodeId,
      required String verifyCode,
      required String email});

  Future<BaseResponse> userResetPwdSend({required String email, String? url});

  Future<BaseResponse> userResetTradingPwdSend(
      {required String email, String? url});

  Future<BaseResponse> userResetTradingPwdSubmit(
      {required String passwordNew,
      required String verifyCodeId,
      required String verifyCode});

  Future<BaseResponse<List<Merchant>?>> aiPulseMerchantEnableList();

  Future<BaseResponse<ImageInfo?>> aiPulseCommonUploadImageFile(
      {required dynamic file});

  Future<BaseResponse<UserKYCInfo?>> aiPulseKycUserKyc();

  Future<BaseResponse> aiPulseKycApply(
      {required String country,
      required int idType,
      required String imageFileId});

  Future<BaseResponse> aiPulseCommonResetPwdVerifyCode({required String email});

  Future<BaseResponse> aiPulseCommonResetTradingPwdVerifyCode(
      {required String email});

  Future<BaseResponse> aiPulseCommonUpdateInfoVerifyCode();

  Future<BaseResponse<List<NoticeInfo>?>> noticeUserNoticeList(
      {required int type});

  Future<BaseResponse<UserInfo?>> userUpdateInfo(
      {required String nickName,
      required String email,
      required String phoneNation,
      required String phoneNumber,
      String? avatar,
      String? verifyCodeId,
      String? verifyCode});

  Future<BaseResponse<UserInfo?>> userInfo();

  Future<BaseResponse> aiPulseDepositDeposit();

  Future<BaseResponse<List<UserBalance>?>> aiPulseWalletGetUserBalance();

  Future<BaseResponse<List<PlanDetail>>> aiPulseUserPlanUserPlan(
      {String? status});

  Future<BaseResponse<PaginationResponse<FlowInfo>?>> aiPulseFlowUserPage(
      {int page = 1, int perPage = 20, int? type});

  Future<BaseResponse<List<FlowTypeInfo>>> aiPulseFlowTypeList();

  Future<BaseResponse<PaginationResponse<SalaryAward>?>>
      aiPulseSalaryAwardUserPage({int page = 1, int perPage = 20});

  Future<BaseResponse<List<DirectTopInfo>>> aiPulseTotalDirectTop();

  Future<BaseResponse<List<LayerInfo>>> aiPulseTotalLayerTotal();

  Future<BaseResponse<List<LayerHashrateInfo>>> aiPulseTotalLayerHashrateTotal(
      {required int layer});

  Future<BaseResponse<EnableJobInfo?>> aiPulseUserJobTitleUserJobTitle();

  Future<BaseResponse<List<EnableJobInfo>>> aiPulseJobTitleEnableJobTitleList();

  Future<BaseResponse<List<PowerInfo>?>> aiPulseHashrateEnableHashrateList();

  Future<BaseResponse<GoogleAuthInfo?>> aiPulseGoogleAuthGetBindCode();

  Future<BaseResponse> aiPulseGoogleAuthBind({required String code});

  Future<BaseResponse> aiPulseGoogleAuthUnBind({required String code});

  Future<BaseResponse> aiPulseGoogleAuthHasBind();

  Future<BaseResponse<UserTeamTotalInfo?>> userTeamDataTotal();

  Future<BaseResponse> aiPulseWithdrawalWithdrawal(
      {required String address,
      required String traderPassword,
      String? googleCode,
      required double amount});
}

class AiPulseServiceImpl extends AiPulseService {
  final ApiClient _apiClient = Get.find();
  final UserController userController = Get.find();

  @override
  Future<BaseResponse<List<Banner>>> aiPulseBannerUserPage(
      {int position = 0}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseBannerUserPage,
          bearerToken: userController.token,
          data: {'position': position},
          deserializer: (data) => data != null
              ? (data as List<dynamic>).map((e) => Banner.fromJson(e)).toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<PaginationResponse<Deposit>?>> aiPulseDeposit(
      {int page = 1, int perPage = 20}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseDepositPage,
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
      return await _apiClient.request(
          ApiEndpoints.aiPulseUserHashrateUserHashrate,
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
      return await _apiClient.request(
          ApiEndpoints.aiPulseCommonRegisterVerifyCode,
          bearerToken: userController.token,
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<PlanDetail?>> aiPulsePlanDetail(
      {required String id}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulsePlanDetail,
          bearerToken: userController.token,
          data: {'id': id},
          deserializer: (data) =>
              data != null ? PlanDetail.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<PaginationResponse<PlanDetail>?>> hashratePage(
      {int page = 1, int perPage = 20}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulsePlanPlanList,
          bearerToken: userController.token,
          data: {
            'page': page,
            'pageSize': perPage,
          },
          deserializer: (data) => data != null
              ? PaginationResponse<PlanDetail>.fromJson(data,
                  (json) => PlanDetail.fromJson(json as Map<String, dynamic>))
              : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<UserIncomeTotal?>> userIncomeTotal() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseFlowIncomeTotal,
          bearerToken: userController.token,
          deserializer: (data) =>
              data != null ? UserIncomeTotal.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseCommonRegisterVerifyCode(
      {required String email}) async {
    try {
      return await _apiClient.request(
          ApiEndpoints.aiPulseCommonRegisterVerifyCode,
          bearerToken: userController.token,
          data: {'email': email},
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseUserPlanApply(
      {required String id,
      required String quantity,
      required String code}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseUserPlanApply,
          bearerToken: userController.token,
          data: {'id': id, 'quantity': quantity, 'code': code},
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<HasrateProgressInfo?>>
      aiPulseUserHashrateProgress() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseUserHashrateProgress,
          bearerToken: userController.token,
          deserializer: (data) =>
              data != null ? HasrateProgressInfo.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<AiChatMessage>?>> aiPulseChatGptSend(
      {required String prompt}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseChatGptSend,
          bearerToken: userController.token,
          data: {'prompt': prompt},
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => AiChatMessage.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<PaginationResponse<AiChatMessage>?>>
      aiPulseChatGptUserPage({int page = 1, int perPage = 20}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseChatGptUserPage,
          bearerToken: userController.token,
          data: {
            'page': page,
            'pageSize': perPage,
          },
          deserializer: (data) => data != null
              ? PaginationResponse<AiChatMessage>.fromJson(
                  data,
                  (json) =>
                      AiChatMessage.fromJson(json as Map<String, dynamic>))
              : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseChatGptClearHistory() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseChatGptClearHistory,
          bearerToken: userController.token, deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> userHasTradingPwd() async {
    try {
      return await _apiClient.request(ApiEndpoints.userHasTradingPwd,
          bearerToken: userController.token, deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<TeamMemberList>?>> userTeamMemberList() async {
    try {
      return await _apiClient.request(ApiEndpoints.userTeamMemberList,
          bearerToken: userController.token,
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => TeamMemberList.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<TeamHashrateCountTotal>?>>
      userTeamHashrateCountTotal() async {
    try {
      return await _apiClient.request(ApiEndpoints.userTeamHashrateCountTotal,
          bearerToken: userController.token,
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => TeamHashrateCountTotal.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> userChangeTradingPwd(
      {required String passwordOld,
      required String passwordNew,
      String? verifyCodeId,
      String? verifyCode}) async {
    try {
      return await _apiClient.request(ApiEndpoints.userChangeTradingPwd,
          bearerToken: userController.token,
          data: {
            "passwordOld": passwordOld,
            "passwordNew": passwordNew,
            if (verifyCodeId != null) "verifyCodeId": verifyCodeId,
            if (verifyCode != null) "verifyCode": verifyCode
          },
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<AmountTotalInfo?>> aiPulseTotalAmountTotal() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseTotalAmountTotal,
          bearerToken: userController.token,
          deserializer: (data) =>
              data != null ? AmountTotalInfo.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> userChangePwd(
      {required String passwordOld,
      required String passwordNew,
      String? verifyCodeId,
      String? verifyCode}) async {
    try {
      return await _apiClient.request(ApiEndpoints.userChangePwd,
          bearerToken: userController.token,
          data: {
            "passwordOld": passwordOld,
            "passwordNew": passwordNew,
            if (verifyCodeId != null) "verifyCodeId": verifyCodeId,
            if (verifyCode != null) "verifyCode": verifyCode
          },
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> userResetPwdSubmit(
      {required String passwordNew,
      required String verifyCodeId,
      required String verifyCode,
      required String email}) async {
    try {
      return await _apiClient.request(ApiEndpoints.userResetPwdSubmit,
          data: {
            "passwordNew": passwordNew,
            "verifyCodeId": verifyCodeId,
            "verifyCode": verifyCode,
            "email": email
          },
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> userResetPwdSend(
      {required String email, String? url}) async {
    try {
      return await _apiClient.request(ApiEndpoints.userResetPwdSend,
          bearerToken: userController.token,
          data: {
            "email": email,
            if (url != null) "url": url,
          },
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> userResetTradingPwdSend(
      {required String email, String? url}) async {
    try {
      return await _apiClient.request(ApiEndpoints.userResetTradingPwdSend,
          bearerToken: userController.token,
          data: {
            "email": email,
            if (url != null) "url": url,
          },
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> userResetTradingPwdSubmit({
    required String passwordNew,
    required String verifyCodeId,
    required String verifyCode,
  }) async {
    try {
      return await _apiClient.request(ApiEndpoints.userResetTradingPwdSubmit,
          bearerToken: userController.token,
          data: {
            "passwordNew": passwordNew,
            "verifyCodeId": verifyCodeId,
            "verifyCode": verifyCode,
          },
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<Merchant>?>> aiPulseMerchantEnableList() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseMerchantEnableList,
          bearerToken: userController.token,
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => Merchant.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<UserKYCInfo?>> aiPulseKycUserKyc() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseKycUserKyc,
          bearerToken: userController.token,
          deserializer: (data) =>
              data != null ? UserKYCInfo.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseKycApply(
      {required String country,
      required int idType,
      required String imageFileId}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseKycApply,
          bearerToken: userController.token,
          data: {
            "country": country,
            "idType": idType,
            "imageFileId": imageFileId
          },
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<ImageInfo?>> aiPulseCommonUploadImageFile(
      {required dynamic file}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseCommonUploadImageFile,
          bearerToken: userController.token,
          data: {"file": file},
          deserializer: (data) =>
              data != null ? ImageInfo.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseCommonResetPwdVerifyCode(
      {required String email}) async {
    try {
      return await _apiClient.request(
          ApiEndpoints.aiPulseCommonResetPwdVerifyCode,
          bearerToken: userController.token,
          data: {
            "email": email,
          },
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseCommonResetTradingPwdVerifyCode(
      {required String email}) async {
    try {
      return await _apiClient.request(
          ApiEndpoints.aiPulseCommonResetTradingPwdVerifyCode,
          bearerToken: userController.token,
          data: {
            "email": email,
          },
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseCommonUpdateInfoVerifyCode() async {
    try {
      return await _apiClient.request(
          ApiEndpoints.aiPulseCommonUpdateInfoVerifyCode,
          bearerToken: userController.token,
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<NoticeInfo>?>> noticeUserNoticeList(
      {required int type}) async {
    try {
      return await _apiClient.request(ApiEndpoints.noticeUserNoticeList,
          bearerToken: userController.token,
          data: {'type': type},
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => NoticeInfo.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<UserInfo?>> userUpdateInfo(
      {required String nickName,
      required String email,
      required String phoneNation,
      required String phoneNumber,
      String? avatar,
      String? verifyCodeId,
      String? verifyCode}) async {
    try {
      return await _apiClient.request(ApiEndpoints.userUpdateInfo,
          bearerToken: userController.token,
          data: {
            "nickName": nickName,
            "email": email,
            "phoneNation": phoneNation,
            "phoneNumber": phoneNumber,
            if (avatar != null) "avatar": avatar,
            if (verifyCodeId != null) "verifyCodeId": verifyCodeId,
            if (verifyCode != null) "verifyCode": verifyCode
          },
          deserializer: (data) =>
              data != null ? UserInfo.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<UserInfo?>> userInfo() async {
    try {
      return await _apiClient.request(ApiEndpoints.userInfo,
          bearerToken: userController.token,
          deserializer: (data) =>
              data != null ? UserInfo.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseDepositDeposit() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseDepositDeposit,
          bearerToken: userController.token, deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<UserBalance>?>> aiPulseWalletGetUserBalance() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseWalletGetUserBalance,
          bearerToken: userController.token,
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => UserBalance.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<PlanDetail>>> aiPulseUserPlanUserPlan(
      {String? status}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseUserPlanUserPlan,
          bearerToken: userController.token,
          data: {if (status != null) 'status': status},
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => PlanDetail.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<PaginationResponse<FlowInfo>?>> aiPulseFlowUserPage(
      {int page = 1, int perPage = 20, int? type}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseFlowUserPage,
          bearerToken: userController.token,
          data: {
            'page': page,
            'pageSize': perPage,
            if (type != null) 'type': type,
          },
          deserializer: (data) => data != null
              ? PaginationResponse<FlowInfo>.fromJson(data,
                  (json) => FlowInfo.fromJson(json as Map<String, dynamic>))
              : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<FlowTypeInfo>>> aiPulseFlowTypeList() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseFlowTypeList,
          bearerToken: userController.token,
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => FlowTypeInfo.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<PaginationResponse<SalaryAward>?>>
      aiPulseSalaryAwardUserPage({int page = 1, int perPage = 20}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseSalaryAwardUserPage,
          bearerToken: userController.token,
          data: {
            'page': page,
            'pageSize': perPage,
          },
          deserializer: (data) => data != null
              ? PaginationResponse<SalaryAward>.fromJson(data,
                  (json) => SalaryAward.fromJson(json as Map<String, dynamic>))
              : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<DirectTopInfo>>> aiPulseTotalDirectTop() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseTotalDirectTop,
          bearerToken: userController.token,
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => DirectTopInfo.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<LayerInfo>>> aiPulseTotalLayerTotal() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseTotalLayerTotal,
          bearerToken: userController.token,
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => LayerInfo.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<LayerHashrateInfo>>> aiPulseTotalLayerHashrateTotal(
      {required int layer}) async {
    try {
      return await _apiClient.request(
          ApiEndpoints.aiPulseTotalLayerHashrateTotal,
          bearerToken: userController.token,
          data: {'layer': layer},
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => LayerHashrateInfo.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<EnableJobInfo?>> aiPulseUserJobTitleUserJobTitle() async {
    try {
      return await _apiClient.request(
          ApiEndpoints.aiPulseUserJobTitleUserJobTitle,
          bearerToken: userController.token,
          deserializer: (data) =>
              data != null ? EnableJobInfo.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<EnableJobInfo>>>
      aiPulseJobTitleEnableJobTitleList() async {
    try {
      return await _apiClient.request(
          ApiEndpoints.aiPulseJobTitleEnableJobTitleList,
          bearerToken: userController.token,
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => EnableJobInfo.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<List<PowerInfo>?>>
      aiPulseHashrateEnableHashrateList() async {
    try {
      return await _apiClient.request(
          ApiEndpoints.aiPulseHashrateEnableHashrateList,
          bearerToken: userController.token,
          deserializer: (data) => data != null
              ? (data as List<dynamic>)
                  .map((e) => PowerInfo.fromJson(e))
                  .toList()
              : []);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<GoogleAuthInfo?>> aiPulseGoogleAuthGetBindCode() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseGoogleAuthGetBindCode,
          bearerToken: userController.token,
          deserializer: (data) =>
              data != null ? GoogleAuthInfo.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseGoogleAuthBind({required String code}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseGoogleAuthBind,
          data: {'code': code},
          bearerToken: userController.token,
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseGoogleAuthUnBind({required String code}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseGoogleAuthUnBind,
          data: {'code': code},
          bearerToken: userController.token,
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseGoogleAuthHasBind() async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseGoogleAuthHasBind,
          bearerToken: userController.token, deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse<UserTeamTotalInfo?>> userTeamDataTotal() async {
    try {
      return await _apiClient.request(ApiEndpoints.userTeamDataTotal,
          bearerToken: userController.token,
          deserializer: (data) =>
              data != null ? UserTeamTotalInfo.fromJson(data) : null);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<BaseResponse> aiPulseWithdrawalWithdrawal(
      {required String address,
      required String traderPassword,
      String? googleCode,
      required double amount}) async {
    try {
      return await _apiClient.request(ApiEndpoints.aiPulseWithdrawalWithdrawal,
          bearerToken: userController.token,
          data: {
            'addressId': address,
            'amount': amount,
            'traderPassword': traderPassword,
            if (googleCode != null) 'googleCode': googleCode,
          },
          deserializer: (data) => data);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
