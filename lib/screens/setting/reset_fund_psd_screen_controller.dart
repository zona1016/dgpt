import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/screens/setting/email_verification_screen_controller.dart';
import 'package:dgpt/screens/setting/reset_fund_psd_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ResetFundPsdScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ResetFundPsdScreenController(), permanent: false, fenix: false);
  }
}

class ResetFundPsdScreenController extends BaseController<ResetFundPsdScreenArgs> {

  final AiPulseService aiPulseService = Get.find();

  final formKey = GlobalKey<FormBuilderState>();

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

  userChangeTradingPwd() async {
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.userChangeTradingPwd(
            passwordOld: oldPsd.value,
            passwordNew: newPsdAgain.value));
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          barrierDismissible: false,
          title: tr('profile.successfully_changed_the_fund_password'),
          confirmText: tr('button.confirm'),
          onConfirmPressed: () {
            Get.close(2);
          }
      );
    }
  }

  userResetTradingPwdSubmit() async {

    EmailVerificationScreenController emailVerificationScreenController = Get.find();

    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.userResetTradingPwdSubmit(
          passwordNew: newPsdAgain.value,
          verifyCode: emailVerificationScreenController.verifyCode.value,
          verifyCodeId: emailVerificationScreenController.verifyCodeId
        ));
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          barrierDismissible: false,
          title: tr('profile.successfully_reset_the_fund_password'),
          confirmText: tr('button.confirm'),
          onConfirmPressed: () {
            Get.close(2);
          }
      );
    }
  }

}
