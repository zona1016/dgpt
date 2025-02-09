import 'package:dgpt/screens/setting/email_verification_screen.dart';
import 'package:dgpt/screens/setting/reset_fund_psd_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:get/get.dart';

class EmailVerificationScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => EmailVerificationScreenController(), permanent: false, fenix: false);
  }
}

class EmailVerificationScreenController extends BaseController<EmailVerificationScreenArgs> {

  final AiPulseService aiPulseService = Get.find();

  RxInt seconds = 60.obs;
  RxBool isResendEnabled = true.obs;

  String verifyCodeId = '';
  RxString verifyCode = ''.obs;

  @override
  void onInit() {
    super.onInit();
    seconds.value = 60;
    isResendEnabled.value = false;
    startTimer();
    verifyCodeId = args?.verifyCodeId ?? '';
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

  conform() {
    Get.toNamed(AppRoutes.resetFundPsd, arguments: ResetFundPsdScreenArgs(isReset: true));
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (seconds.value > 0) {
        seconds.value = seconds.value - 1;
        startTimer();
      } else {
        seconds.value = 60;
        isResendEnabled.value = true;
      }
    });
  }

  aiPulseCommonResetTradingPwdVerifyCode() async {
    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseCommonResetTradingPwdVerifyCode(email: args!.email),
    );
    if (result != null) {
      verifyCodeId = result;
    }
  }


}
