import 'dart:async';

import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
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
  final AiPulseService aiPulseService = Get.find();

  final selectedBannerIndex = 0.obs;
  CarouselSliderController carouselSliderController =
      CarouselSliderController();
  late Timer _timer;

  List<String> titles = ['通告', '邀请', '教学', '企业'];
  List<String> images = [
    'assets/images/home/tg.png',
    'assets/images/home/yq.png',
    'assets/images/home/jx.png',
    'assets/images/home/qy.png'
  ];

  @override
  void onInit() {
    super.onInit();
    aiPulseBanner();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    //     if (selectedBannerIndex < 3) {
    //       carouselSliderController.nextPage();
    //     } else {
    //       carouselSliderController.jumpToPage(0);
    //     }
    //   });
    // });
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

  aiPulseBanner(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final page = loadingState == AppLoadingState.loadMore ? currentPage + 1 : 1;
    final result = await fetchPaginatedData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseDeposit(page: page));
    if (result != null && result.list != null) {}
  }
}
