import 'package:aida/screens/chat/group_profile_screen.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/data_services/services_locatar.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class GroupProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut<GroupProfileScreenController>(() => GroupProfileScreenController(), fenix: false, permanent: false);
  }
}

class GroupProfileScreenController extends BaseController<GroupProfileScreenArgs> {

  final CoreServicesImpl _coreServices = serviceLocator<CoreServicesImpl>();

  V2TimConversation? selectedConversation;

  @override
  void onInit() {
    super.onInit();

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
}
