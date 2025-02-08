import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/services/user_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/widget/form/custom_form_builder_validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailCodeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => EmailCodeScreenController(), permanent: false, fenix: false);
  }
}

class EmailCodeScreenController extends BaseController {
  final AuthService authService = Get.find();
  final UserService userService = Get.find();
  final UserController userController = Get.find();

  final RxString error = "".obs;
  final RxString email = ''.obs;

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
    // final result = await fetchData(
    //     request: () => authService.sendEmailVerification(
    //         type: 'bind-email', email: email!));
    // if (result != null) {
    //   if (navigate) {
    //     // DialogUtils.showSuccessDialog(tr("setting.change_password.success"));
    //     Get.toNamed(AppRoutes.enterOtp,
    //         arguments:
    //         VerifyScreenArgs(type: VerifyType.email, value: email ?? ""));
    //     // formKey.currentState?.reset();
    //   }
    //   DialogUtils.showSuccessDialog(tr("msg.email_verification_code_sent"));
    // }
  }

}
