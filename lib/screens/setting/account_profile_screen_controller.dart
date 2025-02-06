import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/constants/general_constants.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker _picker = ImagePicker();

  RxString avatarFilePath = "".obs;
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString phoneNum = ''.obs;
  Rx<CountryCode> code = CountryCode.fromCountryCode('MY').obs;

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

  Future<void> onPickCoverImage({required BuildContext context}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        print(pickedFile.path);
      }
    } catch (e) {}
  }

  conform() {
    if (formKey.currentState!.saveAndValidate()) {
    }
  }

}
