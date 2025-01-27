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
