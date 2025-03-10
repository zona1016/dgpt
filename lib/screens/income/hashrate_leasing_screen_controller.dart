import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/screens/hashrate/hashrate_password_input_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_detail_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:get/get.dart';

class HashrateLeasingScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HashrateLeasingScreenController(),
        permanent: false, fenix: false);
  }
}

class HashrateLeasingScreenController extends BaseController<HashrateRentalDetailScreenArgs> {
  final AiPulseService aiPulseService = Get.find();

  Rxn<PlanDetail> planDetail = Rxn<PlanDetail>();

  RxInt total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    aiPulsePlanDetail();
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

  aiPulsePlanDetail() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulsePlanDetail(id: args!.hasratePageInfo!.id.toString()));
    if (result != null) {
      planDetail.value = result;
    }
  }

  userHasTradingPwd() async {
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.userHasTradingPwd());
    if (result != null) {
      if (result == true) {
        Get.toNamed(AppRoutes.hashratePasswordInput,
            arguments: HashratePasswordInputScreenArgs(
                pram: {'id': planDetail.value?.id, 'quantity': total.value},
                type: HashratePasswordInputType.hasrate));
      } else {
        Get.toNamed(AppRoutes.settingFundPsd);
      }
    }
  }
}
