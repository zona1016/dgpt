import 'package:dgpt/models/pulse/enable_job_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class SalaryScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => SalaryScreenController(), permanent: false, fenix: false);
  }
}

class SalaryScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();
  Rxn<EnableJobInfo> userJobInfo = Rxn<EnableJobInfo>();
  RxList<EnableJobInfo> enableJobList = <EnableJobInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseUserJobTitleUserJobTitle();
    aiPulseJobTitleEnableJobTitleList();
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

  String formatAmount(int amount) {
    if (amount >= 10000) {
      return '${(amount / 1000).toStringAsFixed(0)}K';
    }
    return amount.toString();
  }

  aiPulseUserJobTitleUserJobTitle() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseUserJobTitleUserJobTitle());
    if (result != null) {
      userJobInfo.value = result;
    }
  }

  aiPulseJobTitleEnableJobTitleList() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseJobTitleEnableJobTitleList());
    if (result != null) {
      enableJobList.value = result;
    }
  }
}
