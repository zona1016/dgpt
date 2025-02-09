import 'package:dgpt/screens/setting/email_verification_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/widget/form/custom_form_builder_validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class ForgetPasswordScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => ForgetPasswordScreenController(),
        permanent: false, fenix: false);
  }
}

class ForgetPasswordScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  final UserController userController = Get.find();

  final RxString error = "".obs;
  final RxString email = ''.obs;

  @override
  void onInit() {
    super.onInit();
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

  sendEmail({bool navigate = true}) async {
    if (!CustomFormBuilderValidators.isEmail(email.value ?? "")) {
      error.value = tr('error.email');
      return;
    }
    final result =
        await fetchData(request: () => aiPulseService.aiPulseCommonResetPwdVerifyCode(email: email.value));
    if (result != null) {
      Get.toNamed(AppRoutes.emailVerification,
          arguments: EmailVerificationScreenArgs(
              email: email.value, type: EmailVerificationType.password));
    }
  }
}
