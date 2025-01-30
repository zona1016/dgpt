import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/services/user_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
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
  final UserService userService = Get.find();
  final UserController userController = Get.find();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  RxString userName = ''.obs;
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

  login() async {
    final result = await fetchData(
      request: () => authService.login(
          account: 'superadmin',
          password: '123456',
          codeId: '0',
          code: 'string'),
    );
    if (result != null) {
      DialogUtils.showLoginSuccess(
          image: 'assets/images/tab/home_inactive.png',
          stateTitle: '登录成功！',
          detail: '请稍等片刻，即将进入产品主页~'
      );
      getUserInfo(result.accessToken);
      userController.saveUser(null, result.accessToken);
    }
  }

  getUserInfo(String token) async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => userService.getUserInfo(token));
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
