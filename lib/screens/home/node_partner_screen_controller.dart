import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NodePartnerScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => NodePartnerScreenController(), permanent: false, fenix: false);
  }
}

class NodePartnerScreenController extends BaseController with GetTickerProviderStateMixin  {

  final AuthService authService = Get.find();

  List<String> descriptionOfAdditionalBenefitList = [
    "Any partner's interest corresponds to a valid accelerator task",
    "Computing power community offline support",
    "Partners enjoy birthday bonus welfare support",
    "Team culture building support",
  ];

  String weHopeYouAr = "1. Recognize DGPT’s platform vision, development philosophy and values "
      "\n2. Familiar with platform business logic and business"
      "\n3. Understand basic AI knowledge and industry prospects"
      "\n4. Honesty, seriousness and hard work"
      "\n5. Formulate corresponding development and promotion plans and implement them"
      "\n6. Complete the work goals and requirements of the company’s node partners"
      "\n7. Partners need to provide accurate work introduction and platform "
      "knowledge to new computing power participants.knowledge training, "
      "organizing company offline business meetings, etc.";

  String appleNow = 'https://t.me/DGPTDirecyorof';

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
