import 'dart:io';

import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/widget/form/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HelpCenterScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HelpCenterScreenController(),
        permanent: false, fenix: false);
  }
}

class HelpCenterScreenController extends BaseController {
  final AuthService authService = Get.find();

  final ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  File? image;

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

  void submitForm() {
    if (formKey.currentState!.validate()) {
      // 这里可以处理表单提交逻辑
      print('Phone: ${phoneController.text}');
      print('Message: ${messageController.text}');
      if (image != null) {
        print('Image path: ${image!.path}');
      }
    }
  }
}
