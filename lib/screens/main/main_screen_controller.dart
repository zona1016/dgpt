import 'package:aida/models/update/app_update_info.dart';
import 'package:aida/screens/auth/welcome_screen_controller.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:aida/utils/packages/dialog.dart';
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

  final selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // _checkForceUpdate();
    pageController = PageController(initialPage: selectedTabIndex.value);
  }

  @override
  void dispose() {
    webViewController?.clearCache();
    webViewController?.dispose();
    super.dispose();
  }
  void _checkForceUpdate() async {
    // final result = await fetchData(
    //     request: () => systemService.checkForceUpdate(),
    //     loadingState: AppLoadingState.backgroundWithoutError);
    // if (result != null) {
    //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //   Source installationSource = await StoreChecker.getSource;
    //   int buildNumber = int.parse(packageInfo.buildNumber);
    //   bool isValidSource =
    //   (installationSource == Source.IS_INSTALLED_FROM_PLAY_STORE ||
    //       installationSource == Source.IS_INSTALLED_FROM_APP_STORE);
    //   bool shouldUpdate =
    //       (GetPlatform.isAndroid && (buildNumber < result.androidVersion)) ||
    //           (GetPlatform.isIOS && (buildNumber < result.iosVersion));
    //   if (result.popup && shouldUpdate && isValidSource) {
    //     if (result.force) {
    //       _showUpdateDialog(result);
    //     } else {
    //       int launchCount =
    //           StorageUtils.read<int>(StorageKeys.launchCount) ?? 0;
    //       if (launchCount == 0) {
    //         _showUpdateDialog(result);
    //         StorageUtils.write(StorageKeys.launchCount, launchCount + 1);
    //       }
    //     }
    //   } else {
    //     StorageUtils.write(StorageKeys.launchCount, 0);
    //   }
    // }
  }

  selectTab(int index) {
    selectedTabIndex(index);
    if (pageController.hasClients) {
      pageController.jumpToPage(index);
    }
  }
}
