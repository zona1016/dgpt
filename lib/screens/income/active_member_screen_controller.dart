import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dgpt/models/pulse/flow_info.dart';

class ActiveMemberScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => ActiveMemberScreenController(),
        permanent: false, fenix: false);
  }
}

class ActiveMemberScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();

  RxInt type = 0.obs;

  RxList<FlowInfo> flowList = <FlowInfo>[].obs;

  List<String> memberList = [
    '基础算力',
    '1级算力',
    '2级算力',
    '3级算力',
    '4级算力',
    '高级算力',
  ];

  List<Color> memberColorList = [
    const Color(0xFF17CE92),
    const Color(0xFF126FA5),
    const Color(0xFF7912A5),
    const Color(0xFFA512A0),
    const Color(0xFFA51214),
    const Color(0xFFE7A304),
  ];

  @override
  void onInit() {
    super.onInit();
    aiPulseFlowUserPage();
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

  aiPulseFlowUserPage(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final page = loadingState == AppLoadingState.loadMore ? currentPage + 1 : 1;
    final result = await fetchPaginatedData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseFlowUserPage(page: page));
    if (result != null && result.list.isNotEmpty) {
      if (loadingState == AppLoadingState.loadMore) {
        flowList.addAll(result.list);
      } else {
        flowList.assignAll(result.list);
      }
    }
  }
}
