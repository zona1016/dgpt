import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/widget/form/custom_form_builder_validators.dart';
import 'package:easy_localization/easy_localization.dart';
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
