import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class SettingScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => SettingScreenController(), permanent: false, fenix: false);
  }
}

class SettingScreenController extends BaseController {

  final AuthService authService = Get.find();

  List<String> settingTitles = [
    '个人资料详情',
    '重置资金密码',
    '更改登入密码',
  ];

  List<String> settingImages = [
    'assets/images/home/setting_grzlxq.png',
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

}
