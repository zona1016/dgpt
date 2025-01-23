import 'dart:async';

import 'package:dgpt/services/auth_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => HomeScreenController(), permanent: false, fenix: false);
  }
}

class HomeScreenController extends BaseController {

  final AuthService authService = Get.find();

  final selectedBannerIndex = 0.obs;
  CarouselSliderController carouselSliderController = CarouselSliderController();
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (selectedBannerIndex < 3) {
        carouselSliderController.nextPage();
      } else {
        carouselSliderController.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

}
