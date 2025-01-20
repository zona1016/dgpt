import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => TaskScreenController(), permanent: false, fenix: false);
  }
}

class TaskScreenController extends BaseController
    with GetTickerProviderStateMixin {
  final AuthService authService = Get.find();

  late TabController tabController;
  late RxInt tabIndex = 0.obs;

  List<String> tabList = ['Personal device', 'Node power'];

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
