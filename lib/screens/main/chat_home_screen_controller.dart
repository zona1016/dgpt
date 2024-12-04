import 'package:aida/models/user/user_info.dart';
import 'package:aida/screens/chat/contact/contact_main_screen_controller.dart';
import 'package:aida/screens/chat/conversation_screen_controller.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatHomeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ChatHomeScreenController(), permanent: false, fenix: false);
    ConversationScreenBindings().dependencies();
    ContactMainScreenBindings().dependencies();
  }
}

class ChatHomeScreenController extends BaseController {

  late PageController pageController;
  UserInfo? userInfo;

  final selectedTabIndex = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedTabIndex.value);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    ToastUtils.init(Get.context!);
  }

  selectTab(int index) {
    selectedTabIndex(index);
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
  }

}
