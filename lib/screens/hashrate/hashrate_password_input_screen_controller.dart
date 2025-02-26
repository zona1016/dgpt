import 'package:dgpt/screens/hashrate/hashrate_password_input_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HashratePasswordInputScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HashratePasswordInputScreenController(),
        permanent: false, fenix: false);
  }
}

class HashratePasswordInputScreenController extends BaseController<HashratePasswordInputScreenArgs> {
  final AiPulseService aiPulseService = Get.find();

  final RxString password = "".obs;

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

  confirm() {
    if (args!.type == HashratePasswordInputType.hasrate) {
      aiPulseUserPlanApply();
    } else if (args!.type == HashratePasswordInputType.withdraw) {
      aiPulseWithdrawalWithdrawal();
    }
  }

  aiPulseUserPlanApply() async {
    Map<String, dynamic> pram = args!.pram;
    pram['code'] = password.value;
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseUserPlanApply(pram: pram));
    if (result != null) {
      Get.toNamed(AppRoutes.hashrateLoading);
    }
  }

  aiPulseWithdrawalWithdrawal() async {
    Map<String, dynamic> pram = args!.pram;
    pram['traderPassword'] = password.value;
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseWithdrawalWithdrawal(pram: pram));
    if (result != null) {
      DialogUtils.showSuccessDialog(tr('profile.withdraw_assets'),
          width: 250,
          height: 197,
          comBorderRadius: BorderRadius.circular(10),
          gradient: BaseColors.diaYebz,
          image: 'assets/images/custom/dia_zjcg.png',
          desc: tr('dia.withdrawal_success_tip'),
          barrierDismissible: false,
          confirmText: tr('button.done'), onConfirmPressed: () {
            Get.close(3);
          });
    }
  }
}
