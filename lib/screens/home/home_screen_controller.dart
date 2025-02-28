import 'dart:async';

import 'package:card_swiper/card_swiper.dart';
import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/models/pulse/user_income_total.dart';
import 'package:dgpt/screens/handling/functionality.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

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
  final UserController userController = Get.find();
  final SwiperController swiperController = SwiperController();

  GlobalKey globalKey = GlobalKey();

  final selectedBannerIndex = 0.obs;
  CarouselSliderController carouselSliderController =
      CarouselSliderController();
  late Timer _timer;

  Rxn<UserIncomeTotal> incomeTotal = Rxn<UserIncomeTotal>();
  RxList<Banner> bannerList = <Banner>[].obs;
  RxList<PlanDetail> planList = <PlanDetail>[].obs;
  RxBool isActivate = false.obs;

  RxInt selectedPlanIndex = 0.obs;

  List<String> titles = [
    tr('home.notice'),
    tr('home.invite'),
    tr('home.teaching'),
    tr('home.enterprise')
  ];
  List<String> images = [
    'assets/images/home/tg.png',
    'assets/images/home/yq.png',
    'assets/images/home/jx.png',
    'assets/images/home/qy.png'
  ];

  @override
  void onInit() {
    super.onInit();
    loadData();
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
    ToastUtils.init(Get.context!);
  }

  Future<void> loadData() async {
    Get.context!.loaderOverlay.show();
    await Future.wait([
      userIncomeTotal(),
      aiPulseBanner(),
      aiPulseUserPlanUserPlan(),
    ]);
    Get.context!.loaderOverlay.hide();
  }

  Future<void> userIncomeTotal() async {
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.userIncomeTotal());
    if (result != null) {
      incomeTotal.value = result;
    }
  }

  Future<void> aiPulseBanner(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final result = await fetchData(
        request: () => aiPulseService.aiPulseBannerUserPage(position: 0),
        loadingState: AppLoadingState.background);
    if (result != null) {}
  }

  Future<void> aiPulseUserPlanUserPlan(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final result = await fetchData(
        request: () => aiPulseService.aiPulseUserPlanUserPlan(status: '1'),
        loadingState: AppLoadingState.background);
    if (result != null && result.isNotEmpty) {
      planList.value = result;
      isActivate.value = true;
    }
  }

  loadImage(BuildContext context) async {
    Functionality.downloadImage(context: context, globalKey: globalKey);
  }

  logout() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => authService.logout());
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          title: '退出成功！',
          desc: '',
          confirmText: '确定',
          onConfirmPressed: () {
            Get.back();
            userController.clearUser();
          });
    }
  }
}

