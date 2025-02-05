import 'package:dgpt/screens/hashrate/hashrate_rental_screen_controller.dart';
import 'package:dgpt/screens/income/income_screen_controller.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/services/user_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_full_lifecycle_controller.dart';
import 'package:dgpt/screens/ai/ai_screen_controller.dart';
import 'package:dgpt/screens/home/home_screen_controller.dart';
import 'package:dgpt/screens/profile/profile_screen_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => MainScreenController(), permanent: false, fenix: false);
    HomeScreenBindings().dependencies();
    AiScreenBindings().dependencies();
    IncomeScreenBindings().dependencies();
    HashrateRentalScreenBindings().dependencies();
    ProfileScreenBindings().dependencies();
  }
}

class MainScreenController extends BaseFullLifeCycleController
    with BaseFullLifeCycleMixin {
  late PageController pageController;
  final AuthService authService = Get.find();
  final UserController userController = Get.find();

  final selectedTabIndex = 2.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedTabIndex.value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  selectTab(int index) {
    print(index);
    selectedTabIndex(index);
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
  }

  @override
  void onDetached() {}

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}


}
