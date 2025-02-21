import 'package:dgpt/models/pulse/flow_info.dart';
import 'package:dgpt/models/pulse/flow_type_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/widget/form/menu_item.dart';
import 'package:get/get.dart';

class CashWalletHistoryScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => CashWalletHistoryScreenController(),
        permanent: false, fenix: false);
  }
}

class CashWalletHistoryScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();

  RxInt type = 0.obs;

  RxList<FlowInfo> flowList = <FlowInfo>[].obs;
  RxList<FlowTypeInfo> flowTypeList = <FlowTypeInfo>[].obs;
  RxList<MenuItem> historyList = <MenuItem>[].obs;

  int? selectedType;

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
        request: () =>
            aiPulseService.aiPulseFlowUserPage(page: page, fromAccount: 0));
    if (result != null && result.list.isNotEmpty) {
      if (loadingState == AppLoadingState.loadMore) {
        flowList.addAll(result.list);
      } else {
        flowList.assignAll(result.list);
      }
    }
  }

  String getNameByType(int? type) {
    try {
      final flowType = flowTypeList.firstWhere((item) => item.value == type);
      return flowType.text;
    } catch (e) {
      return '未找到对应的名称'; // 如果没有找到匹配的 type，返回默认值
    }
  }
}
