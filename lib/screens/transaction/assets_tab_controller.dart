import 'package:dgpt/models/pulse/flow_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class AssetsTabController extends BaseController {
  // final TutorialService tutorialService = Get.find();
  //
  final String type;

  AssetsTabController({required this.type});

  final AiPulseService aiPulseService = Get.find();
  RxList<FlowInfo> flowList = <FlowInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseFlowUserPage();
  }

  aiPulseFlowUserPage(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    int selectedType = 2;
    if (type == 'fundRecords') {
      selectedType = 2;
    }

    if (type == 'transferRecords') {
      selectedType = 0;
    }

    final page = loadingState == AppLoadingState.loadMore ? currentPage + 1 : 1;
    final result = await fetchPaginatedData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseFlowUserPage(page: page, type: selectedType));
    if (result != null && result.list.isNotEmpty) {
      if (loadingState == AppLoadingState.loadMore) {
        flowList.addAll(result.list);
      } else {
        flowList.assignAll(result.list);
      }
    }
  }
}
