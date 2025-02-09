import 'package:dgpt/screens/setting/email_verification_screen.dart';
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

class EmailVerificationScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();

  RxInt seconds = 60.obs;
  RxBool isResendEnabled = true.obs;

  RxString code = ''.obs;

  @override
  void onInit() {
    super.onInit();
    seconds.value = 60;
    isResendEnabled.value = false;
    startTimer();
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
    Get.toNamed(AppRoutes.changePassword);
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

  verifyCode () {
    if (!isResendEnabled.value) return;
    seconds.value = 60;
    isResendEnabled.value = false;
    startTimer();
    switch (args!.type) {
      case EmailVerificationType.register:
        // aiPulseCommonRegisterVerifyCode();
        break;
      case EmailVerificationType.password:
        aiPulseCommonResetPwdVerifyCode();
        break;
      case EmailVerificationType.fundPassword:
        aiPulseCommonResetTradingPwdVerifyCode();
        break;
      case EmailVerificationType.changeEmail:
        aiPulseCommonUpdateInfoVerifyCode();
        break;
    }
  }

  aiPulseCommonResetPwdVerifyCode() async {
    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseCommonResetPwdVerifyCode(email: args!.email),
    );
    if (result != null) {
    }
  }

  aiPulseCommonResetTradingPwdVerifyCode() async {
    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseCommonResetTradingPwdVerifyCode(email: args!.email),
    );
    if (result != null) {
    }
  }

  aiPulseCommonUpdateInfoVerifyCode() async {
    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseCommonUpdateInfoVerifyCode(),
    );
    if (result != null) {
    }
  }

}
