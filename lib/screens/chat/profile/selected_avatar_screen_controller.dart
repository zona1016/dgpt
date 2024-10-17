import 'package:aida/screens/chat/profile/my_profile_detail_screen_controller.dart';
import 'package:aida/screens/chat/profile/profile_setting_screen_controller.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class SelectedAvatarScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut<SelectedAvatarScreenController>(() => SelectedAvatarScreenController(), fenix: false, permanent: false);
  }
}

class SelectedAvatarScreenController extends BaseController {


  @override
  void onInit() {
    super.onInit();
  }

  setFaceUrl(String faceUrl) async {
    await TIMUIKitCore.getInstance().setSelfInfo(
        userFullInfo: V2TimUserFullInfo.fromJson({
      "faceUrl": faceUrl,
    }));

    Get.find<MyProfileDetailScreenController>().updateUserInfo(faceUrl);
    Get.find<ProfileSettingScreenController>().updateUserInfo(faceUrl);
    Get.back();
  }
}
