import 'package:dgpt/models/pulse/merchant.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/widget/form/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RechargeDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => RechargeDetailScreenController(),
        permanent: false, fenix: false);
  }
}

class RechargeDetailScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  final TextEditingController textEditingController = TextEditingController();

  RxBool enabled = false.obs;
  RxList<MenuItem> merchantList = <MenuItem>[].obs;
  Merchant? selectedMerchant;
  RxString url = ''.obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseDepositDeposit();
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

  aiPulseDepositDeposit(
      {AppLoadingState loadingState = AppLoadingState.normal}) async {
    final result = await fetchData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseDepositDeposit());
    if (result != null) {
      url.value = result['url'];
    }
  }
}
