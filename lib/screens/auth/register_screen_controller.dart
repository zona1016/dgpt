import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
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
  final UserController userController = Get.find();

  final RxString error = "".obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxString passwordAgain = ''.obs;
  final RxString inviteCode = ''.obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseCommonRegisterVerifyCode();
  }

  @override
  void onReady() {
    super.onReady();
  }

  register() async {
    aiPulseCommonRegisterVerifyCode();
    return;
    if (!CustomFormBuilderValidators.isEmail(email.value ?? "")) {
      error.value = tr('error.email');
      return;
    }

    final result = await fetchData(
      request: () => authService.register(
          email: email.value,
          password: password.value,
          confirmPassword: passwordAgain.value,
          inviteCode: inviteCode.value),
    );
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          image: 'assets/images/custom/dio_login_success.png',
          title: '注册成功！',
          desc: '请稍等片刻，即将进入产品主页~',
          showCircularProgressIndicator: true);
    }
  }

  aiPulseCommonRegisterVerifyCode() async {
    if (!CustomFormBuilderValidators.isEmail(email.value ?? "")) {
      error.value = tr('error.email');
      return;
    }

    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseCommonRegisterVerifyCode(email: email.value),
    );
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          barrierDismissible: false,
          imageWidget: Image.asset(
            'assets/images/custom/dio_login_success.png',
            width: 144,
            height: 144,
          ),
          title: '注册成功！',
          desc: '请稍等片刻，即将进入产品主页~',
          showCircularProgressIndicator: true);
    }
  }
}
