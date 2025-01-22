import 'package:dgpt/firebase_options.dart';
import 'package:dgpt/models/app_language.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/services/system_service.dart';
import 'package:dgpt/utils/api/api_client.dart';
import 'package:dgpt/utils/constants/app_configurations.dart';
import 'package:dgpt/utils/constants/storage_keys.dart';
import 'package:dgpt/utils/controllers/theme_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/packages/app_link.dart';
import 'package:dgpt/utils/packages/storage_utils.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/theme.dart';
import 'package:dgpt/widget/localization_wrapper.dart';
import 'package:dgpt/widget/restart_widget.dart';
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
  GetInstance().lazyPut<ApiClient>(
      () => ApiClientImpl(baseUrl: AppConfigurations.baseUrl),
      fenix: false,
      permanent: true);

  //Controllers
  GetInstance().lazyPut(() => UserController(), fenix: false, permanent: true);
  // GetInstance().lazyPut(() => ThemeController(), fenix: false, permanent: true);

  // Service
  GetInstance().lazyPut<SystemService>(() => SystemServiceImpl(),
      fenix: false, permanent: true);
  GetInstance().lazyPut<AuthService>(() => AuthServiceImpl(),
      fenix: false, permanent: true);

  final locale = StorageUtils.read(StorageKeys.currentLocale);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

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
      navigatorObservers: [],
      scrollBehavior: AppScrollbehavior(),
      localizationsDelegates: [
        ...context.localizationDelegates,
        FormBuilderLocalizations.delegate
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      fallbackLocale: AppLanguage.defaultLanguage.locale,
      themeMode: ThemeMode.light,
      theme: DefTheme.lightTheme,
      darkTheme: DefTheme.lightTheme,
      title: "DGPT",
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
    if (!userController.isLogin) {
      return AppRoutes.main;
    } else {
      return AppRoutes.splash;
    }
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
