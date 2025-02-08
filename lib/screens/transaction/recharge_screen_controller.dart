import 'package:dgpt/models/pulse/merchant.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RechargeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => RechargeScreenController(),
        permanent: false, fenix: false);
  }
}

class RechargeScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  final TextEditingController textEditingController = TextEditingController();

  RxBool enabled = false.obs;
  RxList<Merchant> merchantList = <Merchant>[].obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseChatGptSend();
    textEditingController.addListener(() {
      String inputText = textEditingController.text;
      if (inputText.isEmpty || inputText == '.') return;
      enabled.value = (double.tryParse(inputText) ?? 0.0) > 10;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  aiPulseChatGptSend(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final result = await fetchData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseMerchantEnableList());
    if (result != null) {

    }
  }
}
