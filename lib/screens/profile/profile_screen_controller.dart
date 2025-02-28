import 'dart:async';

import 'package:dgpt/models/pulse/user_balance.dart';
import 'package:dgpt/screens/handling/functionality.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ProfileScreenController(), permanent: false, fenix: false);
  }
}

class ProfileScreenController extends BaseController {
  final AuthService authService = Get.find();
  final UserController userController = Get.find();
  final AiPulseService aiPulseService = Get.find();

  RxList<UserBalance> userBalanceList = <UserBalance>[].obs;
  RxDouble totalAmount = 0.0.obs;
  RxDouble zpTotalAmount = 0.0.obs;
  RxDouble xjTotalAmount = 0.0.obs;

  GlobalKey globalKey = GlobalKey();

  List<String> profileActionTitles = [
    tr('profile.computing_power_wallet'),
    tr('profile.cash_wallet'),
    tr('profile.withdraw'),
  ];

  List<String> profileActionImages = [
    'assets/images/custom/profile_slqb.png',
    'assets/images/custom/profile_xjqb.png',
    'assets/images/custom/profile_tk.png',
  ];

  List<String> profileTitles = [
    tr('profile.my_orders'),
    tr('profile.share'),
    'KYC',
    tr('profile.customer_service'),
    tr('profile.language_selection'),
    tr('profile.about_us'),
  ];

  List<String> profileImages = [
    'assets/images/custom/profile_wddd.png',
    'assets/images/custom/profile_fx.png',
    'assets/images/custom/profile_kyc.png',
    'assets/images/custom/profile_kf.png',
    'assets/images/custom/profile_yyxz.png',
    'assets/images/custom/profile_gywm.png',
  ];

  @override
  void onInit() {
    super.onInit();
    aiPulseWalletGetUserBalance();
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

  Future<void> aiPulseWalletGetUserBalance({AppLoadingState loadingState = AppLoadingState.normal}) async {
    final result = await fetchData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseWalletGetUserBalance());
    Get.context!.loaderOverlay.hide();
    if (result != null) {
      userBalanceList.value = result;
      zpTotalAmount.value = userBalanceList.value.fold(0.0, (sum, item) {
        if (item.type == 1) {
          return sum + item.balance;
        }
        return sum;
      });

      xjTotalAmount.value = userBalanceList.value.fold(0.0, (sum, item) {
        if (item.type == 0) {
          return sum + item.balance;
        }
        return sum;
      });

      totalAmount.value = xjTotalAmount.value + zpTotalAmount.value;
    }
  }

  loadImage(BuildContext context) async {
    Functionality.downloadImage(context: context, globalKey: globalKey);
  }

  logout()  {
    DialogUtils.showDGPTBaseDialog(
        title: tr('button.logout'),
        desc: '',
        confirmText: tr('button.confirm'),
        cancelText: tr('button.cancel'),
        onConfirmPressed: () {
          Get.back();
          loadLogout();
        });
  }

  loadLogout() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => authService.logout());
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          title: tr('profile.logout_success'),
          desc: '',
          confirmText: tr('button.confirm'),
          onConfirmPressed: () {
            Get.back();
            userController.clearUser();
          });
    }
  }
}
