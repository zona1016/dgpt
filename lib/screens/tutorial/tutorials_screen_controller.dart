import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:easy_localization/easy_localization.dart';
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
    {"title": tr('tutorial.lesson1'), tr('tutorial.duration'): "6Min", "progress": 75, "tag": tr('tutorial.basic_course'), "color": Colors.green},
    {"title": tr('tutorial.lesson2'), tr('tutorial.duration'): "30Min", "progress": 60, "tag": tr('tutorial.basic_course'), "color": Colors.green},
    {"title": tr('tutorial.lesson3'), tr('tutorial.duration'): "60Min", "progress": 40, "tag": tr('tutorial.intermediate_course'), "color": Colors.orange},
    {"title": tr('tutorial.lesson4'), tr('tutorial.duration'): "30Min", "progress": 100, "tag": tr('tutorial.advanced_course'), "color": Colors.red},
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
