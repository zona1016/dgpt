import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingFundPsdScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => SettingFundPsdScreenController(),
        permanent: false, fenix: false);
  }
}

class SettingFundPsdScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();

  final formKey = GlobalKey<FormBuilderState>();

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

  userHasTradingPwd() async {
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.userChangeTradingPwd(
            passwordOld: '',
            passwordNew: newPsdAgain.value,
            verifyCodeId: '',
            verifyCode: ''));
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
        barrierDismissible: false,
        title: tr('home.fund_password_has_been_successfully_set'),
        confirmText: tr('button.confirm'),
        onConfirmPressed: () {
          Get.close(2);
        }
      );
    }
  }
}
