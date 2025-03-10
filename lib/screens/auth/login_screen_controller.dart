import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/widget/form/custom_form_builder_validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => LoginScreenController(), permanent: false, fenix: false);
  }
}

class LoginScreenController extends BaseController {
  final AuthService authService = Get.find();
  final AiPulseService aiPulseService = Get.find();
  final UserController userController = Get.find();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final RxString error = "".obs;
  RxString email = ''.obs;
  RxString password = ''.obs;

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

  login({String? title}) async {
    // if (!CustomFormBuilderValidators.isEmail(email.value ?? "")) {
    //   error.value = tr('error.email');
    //   return;
    // }

    final result = await fetchData(
      request: () => authService.login(
          account: email.value,
          password: password.value,
          codeId: '0',
          code: '0'),
    );
    if (result != null) {
      DialogUtils.showSuccessDialog(
        tr('profile.login_success'),
        titleColor: BaseColors.primaryColor,
        barrierDismissible: false,
        showCircularProgressIndicator: true
      );
      userController.saveUser(null, result.accessToken);
      getUserInfo(result.accessToken);
    }
  }

  getUserInfo(String token) async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.userInfo());
    if (result != null) {
      userController.setUserInfo(result);
      Get.back();
      Get.offAllNamed(AppRoutes.main);
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.signIn();
      print("Google Sign-In successful");
    } catch (error) {
      print("Google Sign-In failed: $error");
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.i.login();
      if (result.status == LoginStatus.success) {
        print("Facebook Sign-In successful");
      } else {
        print("Facebook Sign-In failed");
      }
    } catch (error) {
      print("Error during Facebook login: $error");
    }
  }
}
