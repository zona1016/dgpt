import 'dart:async';

import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class HashrateLoadingScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HashrateLoadingScreenController(),
        permanent: false, fenix: false);
  }
}

class HashrateLoadingScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();

  final List<String> images = [
    'assets/images/home/loading1.png',
    'assets/images/home/loading2.png',
    'assets/images/home/loading3.png',
    'assets/images/home/loading4.png',
  ];

  RxInt currentIndex = 0.obs;
  late Timer timer;

  final RxString password = "".obs;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      currentIndex.value = (currentIndex.value + 1) % images.length;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  aiPulseUserPlanApply() async {
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.aiPulseUserPlanApply(id: args!.hasratePageInfo.id.toString()));
    if (result != null) {

    }
  }
}
