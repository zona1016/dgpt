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

class MyAssetsScreenController extends BaseController with GetTickerProviderStateMixin  {

  final AuthService authService = Get.find();
  final selectedBannerIndex = 0.obs;

  late TabController tabController;
  late RxInt tabIndex = 0.obs;

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
