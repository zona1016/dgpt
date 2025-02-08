import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class KycScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => KycScreenController(),
        permanent: false, fenix: false);
  }
}

class KycScreenController extends BaseController {

  final AuthService authService = Get.find();
  final ImagePicker _picker = ImagePicker();
  Rx<CountryCode> countryCode = CountryCode.fromCountryCode('MY').obs;

  RxString selectedDocument = tr('home.passport').obs;

  var selectedIndex = 0.obs;

  void selectItem(int index) {
    selectedIndex.value = (selectedIndex.value == index) ? -1 : index;
    update();
  }

  final List<String> documents = [
    tr('home.passport'),
    tr('home.id_card'),
    tr('home.driver_license'),
    tr('home.residence_permit'),
  ];

  final List<String> documentsImages = [
    'assets/images/home/kyc_hz.png',
    'assets/images/home/kyc_sfz.png',
    'assets/images/home/kyc_jsz.png',
    'assets/images/home/kyc_jzz.png',
  ];

  void selectDocument(String document) {
    selectedDocument.value = document;
  }

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
}
