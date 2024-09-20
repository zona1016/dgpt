
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:aida/utils/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class LoginScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => LoginScreenController(), permanent: false, fenix: true);
  }
}

class LoginScreenController extends BaseController {
  // final AuthService authService = Get.find();
  final UserController userController = Get.find();
  final loginFormKey = GlobalKey<FormBuilderState>();

  login() async {
    // if (loginFormKey.currentState!.saveAndValidate()) {
    //   final username = loginFormKey.currentState!.value['username'];
    //   final password = loginFormKey.currentState!.value['password'];
    //   final result = await fetchData(
    //     request: () =>
    //         authService.login(username: username, password: password),
    //   );
    //   if (result != null) {
    //     userController.saveUser(result.userInfo, result.accessToken);
    //   }
    // }
  }
}
