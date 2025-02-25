import 'package:dgpt/models/pulse/enable_job_info.dart';
import 'package:dgpt/models/pulse/layer_hashrate_info.dart';
import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/packages/storage_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class SalaryScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => SalaryScreenController(),
        permanent: false, fenix: false);
  }
}

class SalaryScreenController extends BaseController {
  final AiPulseService aiPulseService = Get.find();
  Rxn<EnableJobInfo> userJobInfo = Rxn<EnableJobInfo>();
  Rxn<EnableJobInfo> userNextJobInfo = Rxn<EnableJobInfo>();
  RxList<EnableJobInfo> enableJobList = <EnableJobInfo>[].obs;
  RxList<PowerInfo> hashrateList = <PowerInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    aiPulseUserJobTitleUserJobTitle();
    aiPulseHashrateEnableHashrateList();
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

  String formatAmount(int amount) {
    if (amount >= 10000) {
      return '${(amount / 1000).toStringAsFixed(0)}K';
    }
    return amount.toString();
  }

  aiPulseUserJobTitleUserJobTitle() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseUserJobTitleUserJobTitle());
    if (result != null) {
      userJobInfo.value = result;
      aiPulseJobTitleEnableJobTitleList();
    }
  }

  aiPulseJobTitleEnableJobTitleList() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseJobTitleEnableJobTitleList());
    if (result != null) {
      enableJobList.value = result;
      userNextJobInfo.value = result.firstWhere((item) => item.orderNo == (userJobInfo.value?.orderNo ?? 0) + 1);
    }
  }

  aiPulseHashrateEnableHashrateList() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseHashrateEnableHashrateList());
    if (result != null) {
      hashrateList.value = result;
    }
  }

  String? getConditionDes({ConditionInfo? conditionInfo, required int index}) {
    if (enableJobList.isEmpty) return '';
    conditionInfo ??= enableJobList[index].conditionInfo;

    String? result;
    if (conditionInfo?.hashrateCode != 'none') {
      result = getLevelName(conditionInfo?.hashrateCode);
    } else if (conditionInfo?.directHashrateCode != 'none') {
      result = getLevelName(conditionInfo?.directHashrateCode);
      if (conditionInfo?.directHashrateCount != 0) {
        result = '${result}X${conditionInfo?.directHashrateCount}(${tr('income.positions')})';
      }
    } else if (conditionInfo?.directJobTitleCode != 'none') {
      result = conditionInfo?.directJobTitleCode;
      if (conditionInfo?.directJobTitleCount != 0) {
        result = '${result}X${conditionInfo?.directJobTitleCount}(${tr('income.positions')})';
      }
    } else {
      result = tr('income.unconditional');
    }

    return result;
  }

  String? getLevelName(String? code) {
    if (code == null || hashrateList.isEmpty) return tr('income.no_computing_power');
    return hashrateList.value
        .firstWhereOrNull((info) => info.code == code)?.name ?? tr('income.no_computing_power');
  }
}
