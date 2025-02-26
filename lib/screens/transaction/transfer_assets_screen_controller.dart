import 'package:dgpt/models/pulse/merchant.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/widget/form/menu_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferAssetsScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => TransferAssetsScreenController(),
        permanent: false, fenix: false);
  }
}

class TransferAssetsScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  final TextEditingController textEditingController = TextEditingController();

  RxBool enabled = false.obs;
  RxList<MenuItem> merchantList = <MenuItem>[].obs;
  Merchant? selectedMerchant;
  RxString amount = ''.obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseMerchantEnableList();
    textEditingController.addListener(() {
      String inputText = textEditingController.text;
      if (inputText.isEmpty || inputText == '.') return;
      enabled.value = (double.tryParse(inputText) ?? 0.0) > 0.00000001;
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

  aiPulseMerchantEnableList(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final result = await fetchData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseMerchantEnableList());
    if (result != null) {
      merchantList
          .assignAll(result.map((e) => MenuItem(label: e.currency!, value: e)));
    }
  }

  aiPulseWalletTransfer() async {
    final result = await fetchData(
        request: () =>
            aiPulseService.aiPulseWalletTransfer(amount: amount.value));
    if (result != null) {
      DialogUtils.showSuccessDialog(tr('profile.transfer_assets'),
          width: 250,
          height: 197,
          comBorderRadius: BorderRadius.circular(10),
          gradient: BaseColors.appBarLinearGradient,
          image: 'assets/images/custom/dia_zjcg.png',
          desc: tr('dia.transferred_success_tip'),
          barrierDismissible: false,
          confirmText: tr('button.ok'), onConfirmPressed: () {
        Get.back();
      });
    }
  }
}
