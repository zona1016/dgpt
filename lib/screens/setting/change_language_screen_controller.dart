import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:get/get.dart';

class ChangeLanguageScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => ChangeLanguageScreenController(),
        permanent: false, fenix: true);
  }
}

class ChangeLanguageScreenController extends BaseController {

  final selectedLocale = Get.find<UserController>().selectedLanguage.locale;

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
    super.onReady();
  }
}
