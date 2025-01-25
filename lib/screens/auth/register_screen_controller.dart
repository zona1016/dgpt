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
    if (args != null && args?.referralCode != null) {
      registerFormKey.currentState?.fields['ref_code']
          ?.didChange(args?.referralCode);
    }
  }

  register() async {
    if (registerFormKey.currentState!.saveAndValidate()) {
      isFormValidated.value = true;
      final username = registerFormKey.currentState?.value['username'];
      final password = registerFormKey.currentState?.value['password'];
      final confirmPassword =
          registerFormKey.currentState?.value['confirm_password'];
      final email = registerFormKey.currentState?.value['email'];
      final emailCode = registerFormKey.currentState?.value['email_code'];
      final refCode = registerFormKey.currentState?.value['invitation_code'];

      final result = await fetchData(
        request: () => authService.register(
            nickname: '',
            username: username,
            password: password,
            confirmPassword: confirmPassword,
            email: email,
            emailCode: emailCode,
            refCode: refCode),
      );
      if (result != null) {
        DialogUtils.showSuccessDialog(tr("msg.register_success"));
      }
    }
  }
}
