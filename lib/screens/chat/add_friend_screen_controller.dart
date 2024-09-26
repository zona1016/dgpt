import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class AddFriendScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut<AddFriendScreenController>(() => AddFriendScreenController(), fenix: false, permanent: true);
  }
}

class AddFriendScreenController extends BaseController {

  V2TimConversation? selectedConversation;

  @override
  void onInit() {
    super.onInit();
  }

}
