import 'package:dgpt/models/pulse/flow.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class IncomeHistoryScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => IncomeHistoryScreenController(),
        permanent: false, fenix: false);
  }
}

class IncomeHistoryScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();

  RxInt type = 0.obs;

  RxList<Flow> flowList = <Flow>[].obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseFlowUserPage();
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

  aiPulseFlowUserPage(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final page = loadingState == AppLoadingState.loadMore ? currentPage + 1 : 1;
    final result = await fetchPaginatedData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseFlowUserPage(page: page));
    if (result != null && result.list.isNotEmpty) {
      if (loadingState == AppLoadingState.loadMore) {
        flowList.addAll(result.list);
      } else {
        flowList.assignAll(result.list);
      }
    }
  }
}
