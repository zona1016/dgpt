import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => WithdrawScreenController(),
        permanent: false, fenix: false);
  }
}

class WithdrawScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController addressEditingController = TextEditingController();
  final TextEditingController googleEditingController = TextEditingController();

  RxBool showGoogleAuth = false.obs;
  RxString address = ''.obs;
  RxDouble amount = 0.0.obs;
  RxString googleAuth = ''.obs;

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

  withdraw() {
    Get.toNamed(AppRoutes.hashratePasswordInput);
  }

  aiPulseGoogleAuthHasBind() async {
    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseGoogleAuthHasBind(),
    );
    if (result != null) {
      showGoogleAuth.value = true;
    }
  }
}
