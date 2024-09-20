
import 'package:aida/firebase_options.dart';
import 'package:aida/models/app_language.dart';
import 'package:aida/utils/constants/storage_keys.dart';
import 'package:aida/utils/controllers/theme_controller.dart';
import 'package:aida/utils/controllers/user_controller.dart';
import 'package:aida/utils/packages/app_link.dart';
import 'package:aida/utils/packages/storage_utils.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/theme.dart';
import 'package:aida/widget/localization_wrapper.dart';
import 'package:aida/widget/restart_widget.dart';
import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await StorageUtils.init();
  // await FlutterDownloader.initialize(
  //     debug: true,
  //     // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl:
  //     true // option: set to false to disable working with http links (default: false)
  // );

  //Controllers
  GetInstance().lazyPut(() => UserController(), fenix: false, permanent: true);
  GetInstance().lazyPut(() => ThemeController(), fenix: false, permanent: true);

  // Service
  // GetInstance().lazyPut<SystemService>(() => SystemServiceImpl(),
  //     fenix: false, permanent: true);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(LocalizationWrapper(
        child: DevicePreview(
      enabled: false,
      builder: (context) => const MainApp(),
    )));
  });
  int launchCount = StorageUtils.read<int>(StorageKeys.launchCount) ?? 0;
  if (launchCount > 0) {
    StorageUtils.write(
        StorageKeys.launchCount, launchCount > 4 ? 0 : launchCount + 1);
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TransitionBuilder fToastBuilder = FToastBuilder();
    return RestartWidget(
        child: GetMaterialApp(
      scrollBehavior: AppScrollbehavior(),
      localizationsDelegates: [
        ...context.localizationDelegates,
        FormBuilderLocalizations.delegate
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      fallbackLocale: AppLanguage.defaultLanguage.locale,
      themeMode: Get.find<ThemeController>().currentThemeMode,
      theme: DefTheme.lightTheme,
      darkTheme: DefTheme.darkTheme,
      title: "AIDA",
      initialRoute: getInitialRoute(),
      getPages: AppRoutes.routes,
      onReady: () async {
        ToastUtils.init(context);
        await AppLinkUtils.instance.init();
      },
      builder: (context, child) => GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayColor: Colors.black12,
          overlayWidgetBuilder: (progress) => const Center(
                child: SpinKitFadingCircle(
                  color: BaseColors.primaryColor,
                ),
              ),
          child: fToastBuilder(context, child)),
    ));
  }

  String getInitialRoute() {
    final UserController userController = Get.find<UserController>();
    // if (userController.isLogin) {
    return AppRoutes.main;
    if (userController.isLogin) {
      return AppRoutes.editInterest;
    }
    // else if (userController.userInfo.dob == null) {
    //   return AppRoutes.editDob;
    // }
    else {
      return AppRoutes.main;
    }
    // }
    // return AppRoutes.welcome;
  }
}

class AppScrollbehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context,
      Widget child,
      ScrollableDetails details,
      ) {
    return child;
  }
}