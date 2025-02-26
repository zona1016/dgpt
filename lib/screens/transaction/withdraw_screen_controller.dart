import 'package:dgpt/screens/hashrate/hashrate_password_input_screen.dart';
import 'package:dgpt/screens/profile/profile_screen_controller.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
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
  final ProfileScreenController profileScreenController = Get.find();

  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController addressEditingController =
      TextEditingController();
  final TextEditingController googleEditingController = TextEditingController();

  RxBool showGoogleAuth = false.obs;
  RxString address = ''.obs;
  RxDouble amount = 0.0.obs;
  RxString googleAuth = ''.obs;
  RxBool addressEnable = true.obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseGoogleAuthHasBind();
    aiPulseWithdrawalLastAddress();
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

  withdraw() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.userHasTradingPwd());
    if (result != null) {
      if (result == true) {
        Get.toNamed(AppRoutes.hashratePasswordInput,
            arguments: HashratePasswordInputScreenArgs(pram: {
              "amount": amount.value,
              "address": address.value,
              "googleCode": googleAuth.value
            }, type: HashratePasswordInputType.withdraw));
      } else {
        Get.toNamed(AppRoutes.settingFundPsd);
      }
    }
  }

  aiPulseGoogleAuthHasBind() async {
    final result = await fetchData(
      request: () => aiPulseService.aiPulseGoogleAuthHasBind(),
    );
    if (result != null) {
      showGoogleAuth.value = result;
    }
  }

  aiPulseWithdrawalLastAddress() async {
    final result = await fetchData(
      request: () => aiPulseService.aiPulseWithdrawalLastAddress(),
    );
    if (result != null) {
      addressEditingController.text = result;
      address.value = result;
      addressEnable.value = false;
    }
  }
}
