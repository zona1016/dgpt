import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => WithdrawScreenController(),
        permanent: false, fenix: false);
  }
}

class WithdrawScreenController extends BaseController {
  final AuthService authService = Get.find();
  final TextEditingController textEditingController = TextEditingController();


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
