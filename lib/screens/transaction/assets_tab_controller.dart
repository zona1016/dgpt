import 'package:dgpt/models/pulse/flow_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class AssetsTabController extends BaseController {
  final String type;

  AssetsTabController({required this.type});

  final AiPulseService aiPulseService = Get.find();
  RxList<FlowInfo> flowList = <FlowInfo>[].obs;
  RxBool isFundRecords = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (type == 'fundRecords') {
      isFundRecords.value = true;
    }

    if (type == 'transferRecords') {
      isFundRecords.value = false;
    }
    loadData();
  }

  loadData({AppLoadingState loadingState = AppLoadingState.background}) {
    if (type == 'fundRecords') {
      aiPulseCommonFundList(loadingState: loadingState);
    }

    if (type == 'transferRecords') {
      aiPulseFlowUserPage(loadingState: loadingState);
    }
  }

  aiPulseFlowUserPage(
      {AppLoadingState loadingState = AppLoadingState.background}) async {

    final page = loadingState == AppLoadingState.loadMore ? currentPage + 1 : 1;
    final result = await fetchPaginatedData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseFlowUserPage(page: page, type: 0));
    if (result != null && result.list.isNotEmpty) {
      if (loadingState == AppLoadingState.loadMore) {
        flowList.addAll(result.list);
      } else {
        flowList.assignAll(result.list);
      }
    }
  }

  aiPulseCommonFundList(
      {AppLoadingState loadingState = AppLoadingState.background}) async {

    final page = loadingState == AppLoadingState.loadMore ? currentPage + 1 : 1;
    final result = await fetchPaginatedData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseCommonFundList(page: page));
    if (result != null && result.list.isNotEmpty) {
      if (loadingState == AppLoadingState.loadMore) {
        flowList.addAll(result.list);
      } else {
        flowList.assignAll(result.list);
      }
    }
  }
}
