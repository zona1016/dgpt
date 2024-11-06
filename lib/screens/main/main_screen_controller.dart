import 'package:aida/models/update/app_update_info.dart';
import 'package:aida/models/user/user_info.dart';
import 'package:aida/screens/auth/welcome_screen_controller.dart';
import 'package:aida/services/auth_service.dart';
import 'package:aida/utils/constants/app_enums.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:aida/utils/packages/dialog.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:tencent_calls_uikit/tuicall_kit.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
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
  }

  void login() async {
    final result = await fetchData(
        request: () => authService.login(username: 'czzona', password: 'q123456'),
        loadingState: AppLoadingState.backgroundWithoutError);
    if (result != null) {
      userInfo = result.userInfo;
      final timResult = await TIMUIKitCore.getInstance().login(userID: result.userInfo.imId!, userSig: result.userInfo.userSign!);
      await TUICallKit.instance.login(20002781,
          result.userInfo.imId!,
          result.userInfo.userSign!);
      print(timResult.code);
      Get.toNamed(AppRoutes.conversation);
    }
  }

}
