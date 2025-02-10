import 'package:dgpt/models/pulse/merchant.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/widget/form/menu_item.dart';
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
  RxList<MenuItem> merchantList = <MenuItem>[].obs;
  Merchant? selectedMerchant;
  RxString amount = ''.obs;

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
      merchantList
          .assignAll(result.map((e) => MenuItem(label: e.currency!, value: e)));
    }
  }

  aiPulseDepositDeposit(
      {AppLoadingState loadingState = AppLoadingState.normal}) async {
    final result = await fetchData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseDepositDeposit(
            submitType: selectedMerchant!.currency ?? '',
            amount: textEditingController.text));
    if (result != null) {
      DialogUtils.showRechargeSuccess();
    }
  }
}
