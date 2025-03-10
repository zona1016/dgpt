import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:get/get.dart';

class GoogleSfaScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => GoogleSfaScreenController(), permanent: false, fenix: false);
  }
}

class GoogleSfaScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();
  final UserController userController = Get.find();
  RxBool isSwitched = false.obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseGoogleAuthHasBind();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  aiPulseGoogleAuthHasBind() async {
    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseGoogleAuthHasBind(),
    );
    if (result != null) {
      isSwitched.value = result;
      userController.userInfo.hasBind = result;
      userController.setUserInfo(userController.userInfo);
    }
  }
}
