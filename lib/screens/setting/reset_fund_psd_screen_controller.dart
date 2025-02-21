import 'package:dgpt/screens/setting/email_verification_screen_controller.dart';
import 'package:dgpt/screens/setting/change_fund_psd_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class ResetFundPsdScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ResetFundPsdScreenController(), permanent: false, fenix: false);
  }
}

class ResetFundPsdScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();

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

  userResetTradingPwdSubmit() async {
    EmailVerificationScreenController emailVerificationScreenController = Get.find();

    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.userResetTradingPwdSubmit(
            passwordNew: newPsdAgain.value,
            verifyCode: emailVerificationScreenController.verifyCode.value,
            verifyCodeId: emailVerificationScreenController.verifyCodeId
        ));
    if (result != null) {
      DialogUtils.showSuccessDialog(
        tr('profile.successfully_reset_the_fund_password'),
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
