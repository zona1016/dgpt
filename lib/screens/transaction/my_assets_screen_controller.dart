import 'package:dgpt/screens/transaction/my_assets_screen.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAssetsScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => MyAssetsScreenController(), permanent: false, fenix: false);
  }
}

class MyAssetsScreenController extends BaseController<MyAssetsScreenArgs> with GetTickerProviderStateMixin  {

  final AuthService authService = Get.find();
  final selectedBannerIndex = 0.obs;

  late TabController tabController;
  late RxInt tabIndex = 0.obs;
  RxDouble totalAmount = 0.0.obs;

  List<String> tabList = [tr('profile.fund_records'), tr('profile.transfer_records')];
  final tabs = {
    'fundRecords': tr('profile.fund_records'),
    'transferRecords': tr('profile.transfer_records'),
  };

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: tabList.length, vsync: this)
      ..addListener(() {
        tabIndex.value = tabController.index;
      });

    double zpTotalAmount = args!.userBalanceList!.fold(0.0, (sum, item) {
      if (item.type == 1) {
        return sum + item.balance;
      }
      return sum;
    });

    double xjTotalAmount = args!.userBalanceList!.fold(0.0, (sum, item) {
      if (item.type == 0) {
        return sum + item.balance;
      }
      return sum;
    });

    totalAmount.value = xjTotalAmount + zpTotalAmount;
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

}
