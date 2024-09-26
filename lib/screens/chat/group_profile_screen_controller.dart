import 'package:aida/screens/chat/group_profile_screen.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class GroupProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut<GroupProfileScreenController>(() => GroupProfileScreenController(), fenix: false, permanent: true);
  }
}

class GroupProfileScreenController extends BaseController<GroupProfileScreenArgs> {

  V2TimConversation? selectedConversation;

  @override
  void onInit() {
    super.onInit();
  }

}
