import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/widget/form/custom_form_builder_validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class RegisterScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => RegisterScreenController(),
        permanent: false, fenix: true);
  }
}

class RegisterScreenController extends BaseController {
  final AuthService authService = Get.find();
  final UserController userController = Get.find();

  final RxString error = "".obs;
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxString passwordAgain = ''.obs;

  @override
  void onReady() {
    super.onReady();

  }

  register() async {

    if (!CustomFormBuilderValidators.isEmail(email.value ?? "")) {
      error.value = tr('error.email');
      return;
    }

    final result = await fetchData(
      request: () => authService.register(
          account: 'zona9',
          email: 'czzona27@gmail.com',
          phoneNation: '30',
          phone: '1234567',
          password: '12345678',
          confirmPassword: '12345678',
          inviteCode: 'RTGU1gzWD6'),
    );
    if (result != null) {
      DialogUtils.showLoginSuccess(
          image: 'assets/images/tab/home_inactive.png',
          stateTitle: '注册成功！',
          detail: '请稍等片刻，即将进入产品主页~'
      );
    }
  }
}
