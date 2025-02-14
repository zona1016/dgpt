import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class OrderScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => OrderScreenController(), permanent: false, fenix: false);
  }
}

class OrderScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  RxList<PlanDetail> hasratePageList = <PlanDetail>[].obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseUserPlanUserPlan();
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

  Future<void> aiPulseUserPlanUserPlan(
      {AppLoadingState loadingState = AppLoadingState.normal}) async {
    final result = await fetchData(
        request: () => aiPulseService.aiPulseUserPlanUserPlan(),
        loadingState: loadingState);
    if (result != null) {
      final resultList = result
          .where((item) => item.status == 1 || item.status == 3)
          .toList();

      resultList.sort((a, b) {
        int statusCompare = a.status.compareTo(b.status);
        if (statusCompare != 0) {
          return statusCompare;
        }

        DateTime dateA = DateFormat("yyyy-MM-dd HH:mm:ss").parse(a.beginDate);
        DateTime dateB = DateFormat("yyyy-MM-dd HH:mm:ss").parse(b.beginDate);
        return dateB.compareTo(dateA); // 倒序
      });

      hasratePageList.value = resultList;

    }
  }



}
