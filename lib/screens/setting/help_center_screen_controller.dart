import 'dart:typed_data';

import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_configurations.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:dio/dio.dart' as dio;

class HelpCenterScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HelpCenterScreenController(),
        permanent: false, fenix: false);
  }
}

class HelpCenterScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();

  final ImagePicker _picker = ImagePicker();
  RxString pickedFilePath = ''.obs;
  Uint8List? imageData;
  RxString phone = ''.obs;
  RxString content = ''.obs;

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
        imageData = await pickedFile.readAsBytes();
        pickedFilePath.value = pickedFile.path;
      }
    } catch (e) {}
  }

  aiPulseCommonUploadImageFile() async {
    // String fileExtension = pickedFilePath.value.split('.').last.toLowerCase();
    // List<String> allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp'];
    //
    // print(fileExtension);
    // if (!allowedExtensions.contains(fileExtension)) {
    //   DialogUtils.showBaseDialog(title: '不支持的文件类型');
    //   return;
    // }
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    var file = dio.MultipartFile.fromBytes(imageData!,filename: timestamp,
        contentType: DioMediaType('image', 'png'));
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseCommonUploadImageFile(file: file));
    if (result != null) {
      pickedFilePath.value = '${AppConfigurations.baseUrl}/${result.url}';
      aiPulseMessageUserAdd(result.id.toString());
    }
  }

  aiPulseMessageUserAdd(String imageFileId) async {

    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseMessageUserAdd(
            phone: phone.value,
            content: content.value,
            imageFileId: imageFileId));
    if (result != null) {
      DialogUtils.showMessageSuccess();
    }
  }
}
