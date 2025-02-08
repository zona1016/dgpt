import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemMessageScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => SystemMessageScreenController(),
        permanent: false, fenix: false);
  }
}

class SystemMessageScreenController extends BaseController with GetTickerProviderStateMixin {
  final AuthService authService = Get.find();

  late TabController tabController;
  late RxInt tabIndex = 0.obs;
  final noticeTabs = {
    'update': tr('home.update_notification'),
    'service': tr('home.service_prompt'),
    'system': tr('home.system_announcement'),
  };

  final noticeTabPathList = [
    'assets/images/home/notice_gxts.png',
    'assets/images/home/notice_fwts.png',
    'assets/images/home/notice_xttg.png',
  ];

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: noticeTabs.length, vsync: this)
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
