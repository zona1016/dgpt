import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
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

  aiPulseCommonRegisterVerifyCode() async {

    if (!isResendEnabled.value) return;
    seconds.value = 60;
    isResendEnabled.value = false;
    startTimer();

    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseCommonRegisterVerifyCode(email: ''),
    );
    if (result != null) {

    }
  }

}
