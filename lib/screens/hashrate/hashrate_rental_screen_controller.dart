import 'package:dgpt/models/pulse/hasrate_progress_info.dart';
import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HashrateRentalScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HashrateRentalScreenController(),
        permanent: false, fenix: false);
  }
}

class HashrateRentalScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();

  Rxn<HasrateProgressInfo> progressInfo = Rxn<HasrateProgressInfo>();
  Rxn<PowerInfo> powerInfo = Rxn<PowerInfo>();
  RxList<PlanDetail> hasratePageList = <PlanDetail>[].obs;

  RxBool loaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserHashrateData();
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

  Future<void> loadUserHashrateData() async {
    await Future.wait([
      userHashrate(),
      aiPulseUserHashrateProgress(),
    ]);
    loaded.value = true;
    hashratePage();
  }

  Future<void> userHashrate() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.userHashrate());
    if (result != null) {
      powerInfo.value = result;
    }
  }

  Future<void> aiPulseUserHashrateProgress() async {
    Get.context!.loaderOverlay.hide();
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.aiPulseUserHashrateProgress());
    if (result != null) {
      progressInfo.value = result;
    }
  }

  hashratePage(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final page = loadingState == AppLoadingState.loadMore ? currentPage + 1 : 1;
    final result = await fetchPaginatedData(
        loadingState: loadingState,
        request: () => aiPulseService.hashratePage(page: page));
    if (result != null && result.list.isNotEmpty) {
      if (loadingState == AppLoadingState.loadMore) {
        hasratePageList.addAll(result.list);
      } else {
        hasratePageList.assignAll(result.list);
      }
    }
  }

}
