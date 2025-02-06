import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ResetFundPsdScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ResetFundPsdScreenController(), permanent: false, fenix: false);
  }
}

class ResetFundPsdScreenController extends BaseController {

  final AuthService authService = Get.find();

  final formKey = GlobalKey<FormBuilderState>();

  RxString avatarFilePath = "".obs;
  RxString oldPsd = ''.obs;
  RxString newPsd = ''.obs;
  RxString newPsdAgain = ''.obs;

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

  conform() {

  }

}
