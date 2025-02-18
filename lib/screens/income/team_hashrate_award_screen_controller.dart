import 'package:dgpt/models/pulse/direct_top_info.dart';
import 'package:dgpt/models/pulse/hasrate_progress_info.dart';
import 'package:dgpt/models/pulse/layer_info.dart';
import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/screens/income/income_screen_controller.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class TeamHashrateAwardScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => TeamHashrateAwardScreenController(), permanent: false, fenix: false);
  }
}

class TeamHashrateAwardScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  final IncomeScreenController incomeScreenController = Get.find();

  Rxn<HasrateProgressInfo> progressInfo = Rxn<HasrateProgressInfo>();
  Rxn<PowerInfo> powerInfo = Rxn<PowerInfo>();
  RxBool loaded = false.obs;
  RxList<DirectTopInfo> directTopList = <DirectTopInfo>[].obs;
  RxList<LayerInfo> layerList = <LayerInfo>[].obs;
  RxList<PowerInfo> hashrateList = <PowerInfo>[].obs;

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
    loadUserHashrateData();
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
      aiPulseTotalDirectTop(),
      aiPulseTotalLayerTotal(),
      aiPulseHashrateEnableHashrateList(),
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

  Future<void> aiPulseTotalDirectTop() async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.aiPulseTotalDirectTop());
    if (result != null) {
      directTopList.value = result;
    }
  }

  Future<void> aiPulseTotalLayerTotal() async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.aiPulseTotalLayerTotal());
    if (result != null) {
      layerList.value = result;
    }
  }

  Future<void> aiPulseHashrateEnableHashrateList() async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.aiPulseHashrateEnableHashrateList());
    if (result != null) {
      hashrateList.value = result;
    }
  }

  String? getLevelName(String? code) {
    if (code == null || hashrateList.isEmpty) return '无算力';
    return hashrateList.value
        .firstWhereOrNull((info) => info.code == code)?.name ?? '无算力';
  }
}
