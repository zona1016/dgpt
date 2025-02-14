import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class HashrateRentalActiveScreeBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HashrateRentalActiveScreenController(),
        permanent: false, fenix: false);
  }
}

class HashrateRentalActiveScreenController extends BaseController {
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
        request: () => aiPulseService.aiPulseUserPlanUserPlan(status: '1'),
        loadingState: loadingState);
    if (result != null) {
      hasratePageList.value = result;
    }
  }

}
