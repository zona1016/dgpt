import 'package:dgpt/screens/setting/email_code_screen_controller.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class ResetPasswordScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ResetPasswordScreenController(), permanent: false, fenix: false);
  }
}

class ResetPasswordScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();
  final EmailCodeScreenController emailCodeScreenController = Get.find();

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

  userResetPwdSubmit() async {
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.userResetPwdSubmit(
          passwordNew: newPsdAgain.value,
          verifyCode: emailCodeScreenController.emailCode,
          verifyCodeId: emailCodeScreenController.emailCodeId,
          email: emailCodeScreenController.email.value,
        ));
    if (result != null) {
      DialogUtils.showSuccessDialog(
        tr('profile.password_reset_successfully'),
        image: 'assets/images/custom/dio_psd_success.png',
        titleColor: BaseColors.primaryColor,
        barrierDismissible: false,
        showCircularProgressIndicator: true,
      );
      Future.delayed(const Duration(seconds: 2), () {
        Get.close(4);
      });
    }
  }

}
