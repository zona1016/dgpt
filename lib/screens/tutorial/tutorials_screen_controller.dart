import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TutorialsScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => TutorialsScreenController(), permanent: false, fenix: false);
  }
}

class TutorialsScreenController extends BaseController {

  final AuthService authService = Get.find();
  final List<Map<String, dynamic>> courses = [
    {"title": "第一课", "duration": "6Min", "progress": 75, "tag": "基础课", "color": Colors.green},
    {"title": "第二课", "duration": "30Min", "progress": 60, "tag": "基础课", "color": Colors.green},
    {"title": "第三课", "duration": "60Min", "progress": 40, "tag": "进阶课", "color": Colors.orange},
    {"title": "第四课", "duration": "30Min", "progress": 100, "tag": "高级课", "color": Colors.red},
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

}
