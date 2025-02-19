import 'package:dgpt/models/pulse/hasrate_progress_info.dart';
import 'package:dgpt/models/pulse/layer_info.dart';
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
  RxList<LayerInfo> layerList = <LayerInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseTotalLayerTotal();
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

  aiPulseTotalLayerTotal() async {
    final result = await fetchData(
        loadingState: AppLoadingState.backgroundWithoutError,
        request: () => aiPulseService.aiPulseTotalLayerTotal());
    if (result != null) {
      layerList.value = result;
    }
  }
}
