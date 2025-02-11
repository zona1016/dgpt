import 'package:dgpt/models/pulse/hashrate_page_info.dart';
import 'package:dgpt/models/pulse/hasrate_progress_info.dart';
import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

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
  RxList<HasratePageInfo> hasratePageList = <HasratePageInfo>[].obs;

  var progress = 0.5.obs;  // 50% progress
  var totalUsers = 65.obs;
  var currentUsers = 3.obs;

  @override
  void onInit() {
    super.onInit();
    userHashrate();
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

  userHashrate() async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.userHashrate());
    if (result != null) {
      powerInfo.value = result;
      aiPulseUserHashrateProgress();
    }
  }

  aiPulseUserHashrateProgress() async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.aiPulseUserHashrateProgress());
    if (result != null) {
      progressInfo.value = result;
      hashratePage();
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

  double getProgress() {
    double progress = 0;
    double count = 0;
    if (progressInfo.value?.next?.conditionDto != null) {

      if (progressInfo.value!.next!.conditionDto!.minPlanAmount > 0) {
        progress += progressInfo.value!.planAmount / progressInfo.value!.next!.conditionDto!.minPlanAmount;
        if (progress > 1) {
          progress = 1;
        }
        count += 1;
      }

      if (progressInfo.value!.next!.conditionDto!.teamCount > 0) {
        progress += progressInfo.value!.teamCount / progressInfo.value!.next!.conditionDto!.teamCount;
        if (progress > 1) {
          progress = 1;
        }
        count += 1;
      }

      if (progressInfo.value!.next!.conditionDto!.directCount > 0) {
        progress += progressInfo.value!.directCount / progressInfo.value!.next!.conditionDto!.directCount;
        if (progress > 1) {
          progress = 1;
        }
        count += 1;
      }
    }

    String formattedResult = '0';
    if (count > 0) {
      formattedResult = (progress / (count * 1.0)).toStringAsFixed(4);
    }
    return double.parse(formattedResult);
  }

}
