
import 'package:aida/screens/chat/profile_screen.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class ProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut<ProfileScreenController>(() => ProfileScreenController(), fenix: false, permanent: true);
  }
}

class ProfileScreenController extends BaseController<ProfileScreenArgs> {

  V2TimConversation? selectedConversation;

  @override
  void onInit() {
    super.onInit();
  }

}
