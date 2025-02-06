import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
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

  RxString selectedDocument = '护照'.obs;

  var selectedIndex = 0.obs;

  // 切换选中的项
  void selectItem(int index) {
    // 如果选中了同一项则取消选择
    selectedIndex.value = (selectedIndex.value == index) ? -1 : index;
    update();
  }

  final List<String> documents = [
    '护照',
    '身份证',
    '驾驶证',
    '居留证',
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

  List<String> itemList = [
    'Deployment nodes',
    'SN.',
    'Creation time',
    'Deployment time',
    'Expire date',
  ];

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
