import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class AddFriendDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut<AddFriendDetailScreenController>(() => AddFriendDetailScreenController(), fenix: false, permanent: false);
  }
}

class AddFriendDetailScreenController extends BaseController {

  V2TimConversation? selectedConversation;

  @override
  void onInit() {
    super.onInit();
  }

}
