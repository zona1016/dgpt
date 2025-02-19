import 'package:dgpt/models/api/pagination_response.dart';
import 'package:dgpt/models/pulse/amount_total_info.dart';
import 'package:dgpt/models/pulse/recommend_award_total_info.dart';
import 'package:dgpt/models/pulse/recommend_info.dart';
import 'package:dgpt/models/pulse/user_income_total.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class InvitationAwardScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => InvitationAwardScreenController(), permanent: false, fenix: false);
  }
}

class InvitationAwardScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();

  List<String> actionTitles = [
    tr('home.total_income'),
    '总人数',
  ];

  List<String> actionImages = [
    'assets/images/custom/profile_zsy.png',
    'assets/images/custom/profile_zrs.png',
  ];

  RxList<RecommendInfo> recommendInfoList = <RecommendInfo>[].obs;
  Rxn<RecommendAwardTotalInfo> recommendAwardTotalInfo = Rxn<RecommendAwardTotalInfo>();

  @override
  void onInit() {
    super.onInit();
    aiPulseTotalRecommendAwardTotal();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

 aiPulseTotalRecommendAwardTotal({AppLoadingState loadingState = AppLoadingState.backgroundWithoutError}) async {
    final result = await fetchData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseTotalRecommendAwardTotal());
    if (result != null) {
      recommendAwardTotalInfo.value = result;
      aiPulseTotalRecommendAwardUserList();
    }
  }

  aiPulseTotalRecommendAwardUserList(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final page = loadingState == AppLoadingState.loadMore ? currentPage + 1 : 1;
    final result = await fetchPaginatedData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseTotalRecommendAwardUserList(page: page));
    if (result != null ) {
      if (result.list.isNotEmpty) {
        if (loadingState == AppLoadingState.loadMore) {
          recommendInfoList.addAll(result.list);
        } else {
          recommendInfoList.assignAll(result.list);
        }
      }
    }
  }
}
