import 'package:aida/screens/chat/create_group_introduction_screen.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:get/get.dart';
import 'package:tencent_cloud_chat_uikit/data_services/services_locatar.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class CreateGroupIntroductionScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut<CreateGroupIntroductionScreenController>(() => CreateGroupIntroductionScreenController(), fenix: false, permanent: false);
  }
}

class CreateGroupIntroductionScreenController extends BaseController<CreateGroupIntroductionScreenArgs> {

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
