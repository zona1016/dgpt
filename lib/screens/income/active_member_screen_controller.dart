import 'package:dgpt/models/pulse/layer_hashrate_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/widget/form/menu_item.dart';
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

  RxList<LayerHashrateInfo> layerHashrateList = <LayerHashrateInfo>[].obs;
  RxList<MemberList> memberList = <MemberList>[].obs;
  RxList<MenuItem> layerList = <MenuItem>[].obs;

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
    aiPulseTotalLayerHashrateTotal();
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

  aiPulseTotalLayerHashrateTotal() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () =>
            aiPulseService.aiPulseTotalLayerHashrateTotal(layer: args!.layer));
    if (result != null) {
      layerHashrateList.value = result;

      memberList.value = layerHashrateList
          .where(
              (layer) => layer.memberList != null) // 过滤掉 memberList 为 null 的项
          .expand((layer) {
        return layer.memberList!.map((member) {
          // 为每个 member 赋值 layer 属性
          member.powerInfo = layer.hashrate;
          return member;
        });
      }).toList();

      layerList.value = result.map((e) => MenuItem(label: e.hashrate?.name ?? '', value: e.hashrate?.code))
          .toList();
    }
  }

  loadLayerItem(String code) {
    memberList.value = layerHashrateList
        .where(
            (layer) => layer.memberList != null && layer.hashrate?.code == code) // 过滤掉 memberList 为 null 的项
        .expand((layer) {
      return layer.memberList!.map((member) {
        // 为每个 member 赋值 layer 属性
        member.powerInfo = layer.hashrate;
        return member;
      });
    }).toList();
  }
}
