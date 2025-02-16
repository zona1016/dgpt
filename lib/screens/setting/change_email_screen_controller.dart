import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_configurations.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/widget/form/custom_form_builder_validators.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class ChangeEmailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ChangeEmailScreenController(), permanent: false, fenix: false);
  }
}

class ChangeEmailScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();
  final UserController userController = Get.find();

  final ImagePicker _picker = ImagePicker();

  RxString email = ''.obs;
  RxString verifyCode = ''.obs;
  String verifyCodeId = '';
  final RxString error = "".obs;

  RxInt seconds = 60.obs;
  RxBool isResendEnabled = true.obs;

  Rx<CountryCode> code = CountryCode.fromCountryCode('MY').obs;

  @override
  void onInit() {
    super.onInit();
    email.value = userController.userInfo.email ?? '';
    if (userController.userInfo.phoneNation != null && userController.userInfo.phoneNation != 0) {
      code.value = CountryCode.fromDialCode('+${userController.userInfo.phoneNation}');
    }
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
          aiPulseService.aiPulseCommonUpdateInfoVerifyCode(),
    );
    if (result != null) {
      verifyCodeId = result;
    }
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

  conform() async {
    if (email.value != userController.userInfo.email) {
      aiPulseCommonRegisterVerifyCode();
    }
  }

  userUpdateInfo() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.userUpdateInfo(
            nickName: userController.userInfo.nickName ?? '',
            phoneNation: userController.userInfo.phoneNation!.toString(),
            phoneNumber:userController.userInfo.phone ?? '',
            email: email.value,
            avatar: userController.userInfo.avatar,
            verifyCodeId: verifyCodeId,
            verifyCode: verifyCode.value
        ));
    if (result != null) {
      userController.setUserInfo(result);
      DialogUtils.showDGPTBaseDialog(title: '修改资料成功');
    }
  }

}
