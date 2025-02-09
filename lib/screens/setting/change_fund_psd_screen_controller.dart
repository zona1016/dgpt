import 'package:dgpt/screens/setting/email_verification_screen_controller.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class ChangeFundPsdScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ChangeFundPsdScreenController(), permanent: false, fenix: false);
  }
}

class ChangeFundPsdScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();

  RxString oldPsd = ''.obs;
  RxString newPsd = ''.obs;
  RxString newPsdAgain = ''.obs;

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

  userChangeTradingPwd() async {
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.userChangeTradingPwd(
            passwordOld: oldPsd.value,
            passwordNew: newPsdAgain.value));
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          barrierDismissible: false,
          title: tr('profile.successfully_changed_the_fund_password'),
          confirmText: tr('button.confirm'),
          onConfirmPressed: () {
            Get.close(2);
          }
      );
    }
  }

}
