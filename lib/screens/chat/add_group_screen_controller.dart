import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class AddGroupScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut<AddGroupScreenController>(() => AddGroupScreenController(), fenix: false, permanent: true);
  }
}

class AddGroupScreenController extends BaseController {

  V2TimConversation? selectedConversation;

  @override
  void onInit() {
    super.onInit();
  }

}
