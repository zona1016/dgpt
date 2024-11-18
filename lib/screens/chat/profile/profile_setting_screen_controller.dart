import 'package:aida/screens/chat/group_profile_screen.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/business_logic/view_models/tui_self_info_view_model.dart';
import 'package:tencent_cloud_chat_uikit/data_services/services_locatar.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class ProfileSettingScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut<ProfileSettingScreenController>(
        () => ProfileSettingScreenController(),
        fenix: false,
        permanent: false);
  }
}

class ProfileSettingScreenController
    extends BaseController<GroupProfileScreenArgs> {
  final CoreServicesImpl _coreServices = serviceLocator<CoreServicesImpl>();
  final TUISelfInfoViewModel selfInfoViewModel =
  serviceLocator<TUISelfInfoViewModel>();

  V2TimConversation? selectedConversation;
  late V2TimUserFullInfo userFullInfo;

  final cellTitleList = [
    '邀请好友',
    '获取注册码',
    '设置',
    '帮助中心',
  ];

  final cellImageList = [
    'assets/image/base/profile_cell_hy.png',
    'assets/image/base/profile_cell_qr_code.png',
    'assets/image/base/profile_cell_sz.png',
    'assets/image/base/profile_cell_bz.png',
  ];

  @override
  void onInit() {
    super.onInit();

    V2TimUserFullInfo result =
        TIMUIKitCore.getInstance().loginUserInfo ?? V2TimUserFullInfo();
    String? faceUrl = result.faceUrl;
    result.faceUrl = faceUrl != null
        ? faceUrl.contains('http')
            ? faceUrl
            : 'https://$faceUrl'
        : '';
    userFullInfo = result;

    _coreServices.onCallback = (TIMCallback callbackValue) {
      if (callbackValue.infoRecommendText != null) {
        ToastUtils.showToast(title: callbackValue.infoRecommendText!);
      }
    };
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    ToastUtils.init(Get.context!);
  }

  updateUserInfo(
      {String? faceUrl,
      String? nickName,
      String? selfSignature,
      int? gender,
      int? birthday,
      int? allowType}) {
    if (faceUrl != null) {
      faceUrl = faceUrl.contains('http') ? faceUrl : 'https://$faceUrl';
      userFullInfo.faceUrl = faceUrl;
    }

    if (nickName != null) {
      userFullInfo.nickName = nickName;
    }

    if (selfSignature != null) {
      userFullInfo.selfSignature = selfSignature;
    }

    if (gender != null) {
      userFullInfo.gender = gender;
    }

    if (allowType != null) {
      userFullInfo.allowType = allowType;
    }

    update();
  }
}
