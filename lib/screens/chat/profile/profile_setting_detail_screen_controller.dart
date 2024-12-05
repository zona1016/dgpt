import 'package:aida/screens/chat/profile/profile_setting_detail_screen.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class ProfileSettingDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut<ProfileSettingDetailScreenController>(
        () => ProfileSettingDetailScreenController(),
        fenix: false,
        permanent: false);
  }
}

class ProfileSettingDetailScreenController extends BaseController <ProfileSettingDetailScreenArgs> {

  late V2TimUserFullInfo userFullInfo;

  @override
  void onInit() {
    super.onInit();

    userFullInfo = args!.userFullInfo;
  }

  String getAllowText(int? allowType) {
    if (allowType == 0) {
      return TIM_t("允许任何人");
    }

    if (allowType == 1) {
      return TIM_t("需要验证信息");
    }

    if (allowType == 2) {
      return TIM_t("禁止加我为好友");
    }

    return TIM_t("未指定");
  }

  updateAllowType(int allowType) async {
    userFullInfo.allowType = allowType;
    await TIMUIKitCore.getInstance().setSelfInfo(
        userFullInfo: V2TimUserFullInfo.fromJson({
      "allowType": allowType,
    }));
    update();
  }
}
