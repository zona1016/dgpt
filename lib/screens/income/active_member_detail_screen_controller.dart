import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dgpt/models/pulse/flow_info.dart';

class ActiveMemberDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => ActiveMemberDetailScreenController(),
        permanent: false, fenix: false);
  }
}

class ActiveMemberDetailScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();

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
