import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PowerScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => PowerScreenController(), permanent: false, fenix: false);
  }
}

class PowerScreenController extends BaseController with GetTickerProviderStateMixin {

  final AuthService authService = Get.find();
  final selectedBannerIndex = 0.obs;

  late TabController tabController;
  late RxInt tabIndex = 0.obs;

  late TabController superTabController;
  late RxInt superTabIndex = 0.obs;

  List<String> tabList = ['Accelerator', 'SuperComputing'];

  List<String> superComputingTabList = ["Live", 'Developing', 'Ended'];

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: tabList.length, vsync: this)
      ..addListener(() {
        tabIndex.value = tabController.index;
      });

    superTabController = TabController(length: superComputingTabList.length, vsync: this)
      ..addListener(() {
        superTabIndex.value = superTabController.index;
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
