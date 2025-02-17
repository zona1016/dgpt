import 'package:dgpt/models/pulse/hasrate_progress_info.dart';
import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ActivatedUsersScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ActivatedUsersScreenController(), permanent: false, fenix: false);
  }
}

class ActivatedUsersScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();

  Rxn<HasrateProgressInfo> progressInfo = Rxn<HasrateProgressInfo>();
  Rxn<PowerInfo> powerInfo = Rxn<PowerInfo>();
  RxBool loaded = false.obs;

  List <Color> levelColorList = [
    const Color(0xFF17CE92).withOpacity(0.5),
    const Color(0xFF126FA5).withOpacity(0.5),
    const Color(0xFF7912A5).withOpacity(0.5),
  ];

  List <String> levelTitleList = [
    '第一代',
    '第二代',
    '第三代',
  ];

  List<String> teamTitleList = [
    '总人数',
    '有效会员',
    '今日收益',
    '总收益'
  ];

  List<String> teamTitleImageList = [
    'assets/images/income/team_djhy.png',
    'assets/images/income/team_yxhy.png',
    'assets/images/income/team_jrsy.png',
    'assets/images/income/team_zsy.png'
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

  Future<void> loadUserHashrateData() async {
    Get.context!.loaderOverlay.show();
    await Future.wait([
      userHashrate(),
      aiPulseUserHashrateProgress(),
    ]);
    Get.context!.loaderOverlay.hide();
    loaded.value = true;
  }

  Future<void> userHashrate() async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.userHashrate());
    if (result != null) {
      powerInfo.value = result;
    }
  }

  Future<void> aiPulseUserHashrateProgress() async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.aiPulseUserHashrateProgress());
    if (result != null) {
      progressInfo.value = result;
    }
  }
}
