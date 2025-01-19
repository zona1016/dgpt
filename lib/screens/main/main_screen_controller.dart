import 'package:dgpt/models/update/app_update_info.dart';
import 'package:dgpt/models/user/user_info.dart';
import 'package:dgpt/screens/auth/welcome_screen_controller.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/packages/dialog.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => MainScreenController(), permanent: false, fenix: false);
    WelcomeScreenBindings().dependencies();
    // EventScreenBindings().dependencies();
    // InformationScreenBindings().dependencies();
    // ProfileScreenBindings().dependencies();
    // TutorialScreenBindings().dependencies();
  }
}

class MainScreenController extends BaseController {
  late PageController pageController;
  InAppWebViewController? webViewController;
  final AuthService authService = Get.find();
  String loginImId = '';
  UserInfo? userInfo;

  final selectedTabIndex = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedTabIndex.value);
    super.onInit();
  }

  @override
  void dispose() {
    webViewController?.clearCache();
    webViewController?.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    ToastUtils.init(Get.context!);
    // login();
  }

  void login() async {
    final result = await fetchData(
        request: () => authService.login(username: 'czzona', password: 'q123456'),
        loadingState: AppLoadingState.backgroundWithoutError);
    if (result != null) {

    }
  }

}
