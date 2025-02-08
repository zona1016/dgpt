import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class ChangePasswordScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ChangePasswordScreenController(), permanent: false, fenix: false);
  }
}

class ChangePasswordScreenController extends BaseController {

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

  userChangePwd() async {
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.userChangePwd(
            passwordOld: oldPsd.value,
            passwordNew: newPsdAgain.value));
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          barrierDismissible: false,
          title: '修改密码成功',
          confirmText: tr('button.confirm'),
          onConfirmPressed: () {
            Get.close(2);
          }
      );
    }
  }

}
