import 'package:aida/screens/auth/welcome_screen_controller.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatMainScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ChatMainScreenController(), permanent: false, fenix: false);
    WelcomeScreenBindings().dependencies();
  }
}

class ChatMainScreenController extends BaseController {

  // final V2TIMManager _sdkInstance = TIMUIKitCore.getSDKInstance();
  // final TIMUIKitConversationController _conversationController =
  // TIMUIKitConversationController();
  //
  // late final TIMUIKitConversationController conversationController;
  // late final ValueChanged<V2TimConversation?>? onConversationChanged;
  // late final VoidCallback? onClickSearch;
  // late final ValueChanged<Offset?>? onClickPlus;

  bool isNeedMoveToConversation = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

}
