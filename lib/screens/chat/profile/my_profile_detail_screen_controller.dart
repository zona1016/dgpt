import 'package:aida/models/user/user_info.dart';
import 'package:aida/screens/chat/profile/profile_setting_screen_controller.dart';
import 'package:aida/screens/main/main_screen_controller.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_user_full_info.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/separate_models/tui_profile_view_model.dart';
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
  final TIMUIKitProfileController timuiKitProfileController =
  TIMUIKitProfileController();

  int? birthday;

  @override
  void onInit() {
    super.onInit();

    V2TimUserFullInfo result = TIMUIKitCore.getInstance().loginUserInfo ?? V2TimUserFullInfo();
    String? faceUrl = result.faceUrl;
    result.faceUrl = faceUrl != null ? faceUrl.contains('http') ? faceUrl
        : 'https://$faceUrl' : '';
    userFullInfo = result;
    birthday = userFullInfo.birthday;
  }

  updateUserInfo({String? faceUrl}) {
    if (faceUrl != null) {
      faceUrl = faceUrl.contains('http') ? faceUrl
          : 'https://$faceUrl';
      userFullInfo.faceUrl = faceUrl;
    }
    update();
  }

  updateNickName(String nickName) async {
    userFullInfo.nickName = nickName;
    await TIMUIKitCore.getInstance().setSelfInfo(
        userFullInfo: V2TimUserFullInfo.fromJson({
          "nickName": nickName,
        }));
    _update(nickName: nickName);
  }

  updateSelfSignature(String selfSignature) async {
    userFullInfo.selfSignature = selfSignature;
    await TIMUIKitCore.getInstance().setSelfInfo(
        userFullInfo: V2TimUserFullInfo.fromJson({
          "selfSignature": selfSignature,
        }));
    _update(selfSignature: selfSignature);
  }

  updateGender(int gender) async {
    userFullInfo.gender = gender;
    await TIMUIKitCore.getInstance().setSelfInfo(
        userFullInfo: V2TimUserFullInfo.fromJson({
          "gender": gender,
        }));
    _update(gender: gender);
  }

  updateBirthday(int birthday) async {
    userFullInfo.birthday = birthday;
    await TIMUIKitCore.getInstance().setSelfInfo(
        userFullInfo: V2TimUserFullInfo.fromJson({
          "birthday": birthday,
        }));
    _update(birthday: birthday);
  }

  _update(
      {String? faceUrl,
      String? nickName,
      String? selfSignature,
      int? gender,
      int? birthday}) {
    Get.find<ProfileSettingScreenController>().updateUserInfo(
        faceUrl: faceUrl,
        nickName: nickName,
        selfSignature: selfSignature,
        gender: gender,
        birthday: birthday);
    update();
  }
}
