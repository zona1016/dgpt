import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/ui/controller/tim_uikit_conversation_controller.dart';

class ConversationScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ConversationScreenController(), permanent: false, fenix: false);
  }
}

class ConversationScreenController extends BaseController {

  final TIMUIKitConversationController conversationController =
  TIMUIKitConversationController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

}
