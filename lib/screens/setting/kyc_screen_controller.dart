import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/models/pulse/user_kyc_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_configurations.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class KycScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => KycScreenController(), permanent: false, fenix: false);
  }
}

class KycScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  final ImagePicker _picker = ImagePicker();
  Rx<CountryCode> countryCode = CountryCode.fromCountryCode('MY').obs;

  Rxn<UserKYCInfo> userKYCInfo = Rxn<UserKYCInfo>();
  RxString selectedDocument = tr('home.passport').obs;

  var selectedIndex = 0.obs;

  RxString pickedFilePath = ''.obs;

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
    aiPulseKycUserKyc();
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
        pickedFilePath.value = pickedFile.path;
      }
    } catch (e) {}
  }

  aiPulseCommonUploadImageFile() async {
    String fileExtension = pickedFilePath.value.split('.').last.toLowerCase();
    List<String> allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp'];

    if (!allowedExtensions.contains(fileExtension)) {
      DialogUtils.showBaseDialog(title: '不支持的文件类型');
      return;
    }
    var file = await dio.MultipartFile.fromFile(pickedFilePath.value,
        contentType: DioMediaType('image', fileExtension));
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseCommonUploadImageFile(file: file));
    if (result != null) {
      aiPulseKycApply(result.id.toString());
    }
  }

  aiPulseKycApply(String imageFileId) async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseKycApply(
            country: countryCode.value.code!,
            idType: selectedIndex.value,
            imageFileId: imageFileId));
    if (result != null) {
      aiPulseKycUserKyc();
    }
  }

  aiPulseKycUserKyc() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseKycUserKyc());
    if (result != null) {
      userKYCInfo.value = result;
      countryCode.value = CountryCode.fromCountryCode(result.country);
      selectedIndex.value = result.idType;

      pickedFilePath.value = '${AppConfigurations.baseUrl}/${result.imageFileIdUrl}';
    }
  }
}
