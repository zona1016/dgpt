import 'package:dgpt/screens/auth/login_screen_controller.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/services/user_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/widget/form/custom_form_builder_validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => RegisterScreenController(),
        permanent: false, fenix: true);
  }
}

class RegisterScreenController extends BaseController {
  final AuthService authService = Get.find();
  final AiPulseService aiPulseService = Get.find();
  final UserService userService = Get.find();
  final UserController userController = Get.find();

  final RxString error = "".obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxString passwordAgain = ''.obs;
  final RxString inviteCode = ''.obs;
  final RxString verifyCode = ''.obs;
  final RxString codeId = ''.obs;

  RxInt seconds = 60.obs;
  RxBool isResendEnabled = true.obs;

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
    super.onReady();
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

  register() async {
    if (!CustomFormBuilderValidators.isEmail(email.value)) {
      error.value = tr('error.email');
      return;
    }

    final result = await fetchData(
      request: () => authService.register(
          email: email.value,
          password: password.value,
          confirmPassword: passwordAgain.value,
          verifyCodeId: codeId.value,
          verifyCode: verifyCode.value,
          inviteCode: inviteCode.value),
    );
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          imageWidget: Image.asset(
            'assets/images/custom/dio_login_success.png',
            height: 144,
            width: 144,
          ),
          title: '注册成功！',
          desc: '请稍等片刻，即将进入产品主页~',
          showCircularProgressIndicator: true);
      getUserInfo(result.accessToken);
      userController.saveUser(null, result.accessToken);
    }
  }

  aiPulseCommonRegisterVerifyCode() async {

    if (!CustomFormBuilderValidators.isEmail(email.value)) {
      error.value = tr('error.email');
      return;
    } else {
      error.value = '';
    }

    if (!isResendEnabled.value) return;
    seconds.value = 60;
    isResendEnabled.value = false;
    startTimer();

    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseCommonRegisterVerifyCode(email: email.value),
    );
    if (result != null) {
      codeId.value = result;
    }
  }

  getUserInfo(String token) async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => userService.getUserInfo(token));
    if (result != null) {
      userController.setUserInfo(result);
      Get.back();
      Get.offAllNamed(AppRoutes.main);
    }
  }
}
