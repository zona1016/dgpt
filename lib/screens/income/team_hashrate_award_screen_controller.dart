import 'package:dgpt/models/pulse/amount_total_info.dart';
import 'package:dgpt/models/pulse/hasrate_progress_info.dart';
import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/models/pulse/user_income_total.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class TeamHashrateAwardScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => TeamHashrateAwardScreenController(), permanent: false, fenix: false);
  }
}

class TeamHashrateAwardScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();

  Rxn<HasrateProgressInfo> progressInfo = Rxn<HasrateProgressInfo>();
  Rxn<PowerInfo> powerInfo = Rxn<PowerInfo>();
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
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.aiPulseUserHashrateProgress());
    if (result != null) {
      progressInfo.value = result;
    }
  }
}
