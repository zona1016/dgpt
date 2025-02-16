import 'package:dgpt/screens/setting/change_fund_psd_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class SettingScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => SettingScreenController(),
        permanent: false, fenix: false);
  }
}

class SettingScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  final AuthService authService = Get.find();
  final UserController userController = Get.find();

  List<String> settingTitles = [
    tr('profile.profile_details'),
    "重置邮件箱",
    tr('profile.reset_transaction_password'),
    tr('profile.change_login_password'),
  ];

  List<String> settingImages = [
    'assets/images/home/setting_grzlxq.png',
    'assets/images/home/setting_czyjx.png',
    'assets/images/home/setting_czzjmm.png',
    'assets/images/home/setting_ggdrmm.png',
  ];

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

  userHasTradingPwd() async {
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.userHasTradingPwd());
    if (result != null) {
      if (result == true) {
        Get.toNamed(AppRoutes.changeFundPsd);
      } else {
        Get.toNamed(AppRoutes.settingFundPsd);
      }
    }
  }

  logout()  {

    DialogUtils.showDGPTBaseDialog(
        title: tr('button.logout'),
        desc: '',
        confirmText: tr('button.confirm'),
        cancelText: tr('button.cancel'),
        onConfirmPressed: () {
          Get.back();
          loadLogout();
        });
  }

  loadLogout() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => authService.logout());
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          title: tr('profile.logout_success'),
          desc: '',
          confirmText: tr('button.confirm'),
          onConfirmPressed: () {
            Get.back();
            userController.clearUser();
          });
    }
  }
}
