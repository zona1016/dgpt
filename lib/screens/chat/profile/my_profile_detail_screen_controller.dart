import 'package:aida/models/user/user_info.dart';
import 'package:aida/screens/main/main_screen_controller.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class MyProfileDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut<MyProfileDetailScreenController>(() => MyProfileDetailScreenController(), fenix: false, permanent: false);
  }
}

class MyProfileDetailScreenController extends BaseController {

  late V2TimUserFullInfo userFullInfo;
  MainScreenController mainScreenController = Get.find<MainScreenController>();

  @override
  void onInit() {
    super.onInit();

    V2TimUserFullInfo result = TIMUIKitCore.getInstance().loginUserInfo ?? V2TimUserFullInfo();
    String? faceUrl = result.faceUrl;
    result.faceUrl = faceUrl != null ? faceUrl.contains('http') ? faceUrl
        : 'https://$faceUrl' : '';
    userFullInfo = result;
  }

  updateUserInfo(String faceUrl) {
    faceUrl = faceUrl.contains('http') ? faceUrl
        : 'https://$faceUrl';
    userFullInfo.faceUrl = faceUrl;
    update();
  }

}
