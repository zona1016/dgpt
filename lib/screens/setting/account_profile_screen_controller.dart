import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AccountProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => AccountProfileScreenController(), permanent: false, fenix: false);
  }
}

class AccountProfileScreenController extends BaseController {

  final AuthService authService = Get.find();

  final formKey = GlobalKey<FormBuilderState>();

  String userName = '';
  String password = '';

  RxBool canLogin = false.obs;

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
