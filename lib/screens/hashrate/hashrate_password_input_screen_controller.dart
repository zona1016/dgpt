import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/widget/form/menu_item.dart';
import 'package:get/get.dart';

class HashratePasswordInputScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HashratePasswordInputScreenController(),
        permanent: false, fenix: false);
  }
}

class HashratePasswordInputScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();

  final RxString password = "".obs;

  @override
  void onInit() {
    super.onInit();
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

  aiPulseUserPlanApply() async {
    print(args!.hasratePageInfo.id.toString());
    return;
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.aiPulseUserPlanApply(id: args!.hasratePageInfo.id.toString()));
    if (result != null) {

    }
  }
}
