import 'package:dgpt/models/pulse/google_auth_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:get/get.dart';

class GoogleAuthScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => GoogleAuthScreenController(), permanent: false, fenix: false);
  }
}

class GoogleAuthScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();
  final UserController userController = Get.find();

  Rxn<GoogleAuthInfo> googleAuthInfo = Rxn<GoogleAuthInfo>();

  @override
  void onInit() {
    super.onInit();
    aiPulseGoogleAuthGetBindCode();
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

  aiPulseGoogleAuthGetBindCode() async {
    final result = await fetchData(
      request: () =>
          aiPulseService.aiPulseGoogleAuthGetBindCode(),
    );
    if (result != null) {
      googleAuthInfo.value = result;
    }
  }

}
