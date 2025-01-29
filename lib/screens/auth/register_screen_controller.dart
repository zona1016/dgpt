import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  final registerFormKey = GlobalKey<FormBuilderState>();

  @override
  void onReady() {
    super.onReady();

  }

  register() async {
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
    if (registerFormKey.currentState!.saveAndValidate()) {
      isFormValidated.value = true;
      final account = registerFormKey.currentState?.value['account'];
      final email = registerFormKey.currentState?.value['email'];
      final phoneNation =
          registerFormKey.currentState?.value['phoneNation'];
      final phone = registerFormKey.currentState?.value['phone'];
      final password = registerFormKey.currentState?.value['password'];
      final confirmPassword = registerFormKey.currentState?.value['confirmPassword'];
      final inviteCode = registerFormKey.currentState?.value['inviteCode'];

      final result = await fetchData(
        request: () => authService.register(
            account: '123456',
            email: 'czzona27@gmail.com',
            phoneNation: '30',
            phone: '1234567',
            password: 'Abcd@1234',
            confirmPassword: 'Abcd@1234',
            inviteCode: '2340'),
      );
      if (result != null) {
        DialogUtils.showSuccessDialog(tr("msg.register_success"));
      }
    }
  }
}
