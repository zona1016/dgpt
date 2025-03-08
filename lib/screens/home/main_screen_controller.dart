
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class MainScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => MainScreenController(), permanent: false, fenix: false);
  }
}

class MainScreenController extends BaseController {
  late PageController pageController;
  InAppWebViewController? webViewController;
  String loginImId = '';

  final selectedTabIndex = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedTabIndex.value);
    super.onInit();
  }

  @override
  void dispose() {
    webViewController?.clearCache();
    webViewController?.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    ToastUtils.init(Get.context!);
    // login();
  }

}
