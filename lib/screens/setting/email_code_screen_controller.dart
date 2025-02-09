import 'package:dgpt/screens/setting/email_code_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailCodeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => EmailCodeScreenController(), permanent: false, fenix: false);
  }
}

class EmailCodeScreenController extends BaseController<EmailCodeScreenArgs>  {
  final AiPulseService aiPulseService = Get.find();
  final UserController userController = Get.find();

  final RxString error = "".obs;
  final RxString email = ''.obs;

  String emailCode = '';
  String emailCodeId = '';

  RxInt seconds = 60.obs;
  RxBool isResendEnabled = false.obs;

  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      FocusScope.of(Get.context!).requestFocus(focusNode);
    });
    startTimer();
    emailCodeId = args!.codeId;
    email.value = args!.email;
  }

  @override
  void dispose() {
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
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

  sendEmail() async {
    if (!isResendEnabled.value) return;
    isResendEnabled.value = false;
    startTimer();

    aiPulseCommonResetPwdVerifyCode();
  }

  aiPulseCommonResetPwdVerifyCode() async {
    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseCommonResetPwdVerifyCode(email: args!.email),
    );
    if (result != null) {
      emailCodeId = result;
    }
  }
}
