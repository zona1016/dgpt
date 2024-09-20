import 'package:aida/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => WelcomeScreenController(), permanent: false, fenix: false);
    // HomeScreenBindings().dependencies();
    // EventScreenBindings().dependencies();
    // InformationScreenBindings().dependencies();
    // ProfileScreenBindings().dependencies();
    // TutorialScreenBindings().dependencies();
  }
}

class WelcomeScreenController extends BaseController {
  late PageController pageController;
  final selectedBannerIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

}
