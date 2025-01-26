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

  List<String> settingList = [
    'My avatar',
    'My nickname',
    'My email',
    'Phone number',
    'Reset Funds Password',
    'Modify Password',
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
