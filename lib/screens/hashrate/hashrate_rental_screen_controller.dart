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

  RxInt teamMemberCount = 0.obs;
  RxInt teamHashrateCount = 0.obs;

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

  userTeamMemberList() async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.userTeamMemberList());
    if (result != null) {
      teamMemberCount.value = result.length;
    }
  }

  userTeamHashrateCountTotal() async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.userTeamHashrateCountTotal());
    if (result != null) {
      teamHashrateCount.value = result.length;
    }
  }
}
