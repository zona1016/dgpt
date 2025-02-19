import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguageScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => ChangeLanguageScreenController(),
        permanent: false, fenix: true);
  }
}

class ChangeLanguageScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  final Locale selectedLocale =
      Get.find<UserController>().selectedLanguage.locale;

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

  userSetLang(String long) async {
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.userSetLang(long: long));
  }
}
