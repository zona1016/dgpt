import 'package:dgpt/models/pulse/google_auth_info.dart';
import 'package:dgpt/screens/setting/google/google_sfa_screen_controller.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleVerifyScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => GoogleVerifyScreenController(),
        permanent: false, fenix: false);
  }
}

class GoogleVerifyScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  final UserController userController = Get.find();
  final GoogleSfaScreenController googleController = Get.find();
  TextEditingController textController = TextEditingController();

  RxBool hasBind = false.obs;
  Rxn<GoogleAuthInfo> googleAuthInfo = Rxn<GoogleAuthInfo>();

  RxString textValue = ''.obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseGoogleAuthHasBind();
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

  confirm() {
    if (userController.userInfo.hasBind == false) {
      aiPulseGoogleAuthGetBindCode();
    } else {
      aiPulseGoogleAuthUnBind();
    }
  }

  aiPulseGoogleAuthHasBind() async {
    final result = await fetchData(
      request: () => aiPulseService.aiPulseGoogleAuthHasBind(),
    );
    if (result != null) {
      hasBind.value = result;
    }
  }

  aiPulseGoogleAuthGetBindCode() async {
    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseGoogleAuthBind(code: textController.text),
    );
    if (result != null) {
      userController.userInfo.hasBind = true;
      googleController.isSwitched.value = true;
      userController.setUserInfo(userController.userInfo);
      DialogUtils.showDGPTBaseDialog(
        barrierDismissible: false,
        title: '绑定成功',
        confirmText: tr('button.confirm'),
        onConfirmPressed: () {
          Get.close(4);
        }
      );
    }
  }

  aiPulseGoogleAuthUnBind() async {
    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseGoogleAuthUnBind(code: textController.text),
    );
    if (result != null) {
      userController.userInfo.hasBind = false;
      googleController.isSwitched.value = false;
      userController.setUserInfo(userController.userInfo);
      DialogUtils.showDGPTBaseDialog(
          barrierDismissible: false,
          title: '解绑成功',
          confirmText: tr('button.confirm'),
          onConfirmPressed: () {
            Get.close(4);
          }
      );
    }
  }
}
