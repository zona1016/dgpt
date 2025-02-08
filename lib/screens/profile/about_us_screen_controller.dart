import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => AboutUsScreenController(),
        permanent: false, fenix: false);
  }
}

class AboutUsScreenController extends BaseController
    with GetTickerProviderStateMixin {
  final AuthService authService = Get.find();
  final selectedBannerIndex = 0.obs;

  late TabController tabController;
  late RxInt tabIndex = 0.obs;

  late TabController superTabController;
  late RxInt superTabIndex = 0.obs;

  List<String> tabList = [tr('home.company_introduction'), tr('home.contact_us')];
  List<String> tabPathList = [
    'assets/images/home/gsjs.png',
    'assets/images/home/lxwm.png'
  ];
  List<String> urlPathList = [
    'assets/images/home/facebook.png',
    'assets/images/home/email.png',
    'assets/images/home/telegram.png',
    'assets/images/home/sp.png',
    'assets/images/home/google.png',
    'assets/images/home/x.png',
  ];

  List<String> urlList = [
    'https://www.facebook.com/dgptcloud',
    'https://www.youtube.com/@DGPT_AI',
    'https://t.me/DGPT_Cloud',
    'https://www.tiktok.com/@dgpt_ai',
    'https://www.instagram.com/dgpt_ai',
    'https://x.com/dgpt_cloud',
  ];

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
