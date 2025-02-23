import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_configurations.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/widget/form/custom_form_builder_validators.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class AccountProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => AccountProfileScreenController(), permanent: false, fenix: false);
  }
}

class AccountProfileScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();
  final UserController userController = Get.find();

  final ImagePicker _picker = ImagePicker();

  RxString pickedFilePath = ''.obs;
  RxString nickName = ''.obs;
  RxString phoneNumber = ''.obs;
  final RxString error = "".obs;

  RxInt seconds = 60.obs;
  RxBool isResendEnabled = true.obs;

  Rx<CountryCode> code = CountryCode.fromCountryCode('MY').obs;

  @override
  void onInit() {
    super.onInit();
    nickName.value = userController.userInfo.account ?? '';
    if (userController.userInfo.phoneNation != null && userController.userInfo.phoneNation != 0) {
      code.value = CountryCode.fromDialCode('+${userController.userInfo.phoneNation}');
    }
    phoneNumber.value = userController.userInfo.phone ?? '';
    pickedFilePath.value = userController.userInfo.avatar ?? '';
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
      pickedFilePath.value = '${AppConfigurations.baseUrl}/${result.url}';
    }
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (seconds.value > 0) {
        seconds.value = seconds.value - 1;
        startTimer();
      } else {
        seconds.value = 60;
        isResendEnabled.value = true;
      }
    });
  }

  conform() async {
    userUpdateInfo();
  }

  userUpdateInfo() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.userUpdateInfo(
          nickName: nickName.value,
          phoneNation: code.value.dialCode ?? '',
          phoneNumber: phoneNumber.value,
          email: userController.userInfo.email ?? '',
          avatar: pickedFilePath.value,
        ));
    if (result != null) {
      userController.setUserInfo(result);
      DialogUtils.showDGPTBaseDialog(title: '修改资料成功');
    }
  }

}
