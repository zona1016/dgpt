import 'package:dgpt/models/pulse/hashrate_page_detail.dart';
import 'package:dgpt/screens/hashrate/hashrate_password_input_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_detail_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:get/get.dart';

class HashrateRentalDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HashrateRentalDetailScreenController(),
        permanent: false, fenix: false);
  }
}

class HashrateRentalDetailScreenController extends BaseController<HashrateRentalDetailScreenArgs> {
  final AiPulseService aiPulseService = Get.find();

  RxString dd = 'dd'.obs;
  Rxn<HashratePageDetail> hashratePageDetail = Rxn<HashratePageDetail>();

  RxInt total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    userHashrate();
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

  userHashrate() async {
    final result = await fetchData(
        loadingState: AppLoadingState.background,
        request: () => aiPulseService.hashratePageDetail(id: args!.hasratePageInfo!.id.toString()));
    if (result != null) {
      hashratePageDetail.value = result;
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
                hasratePageInfo: args!.hasratePageInfo,
                count: total.value));
      } else {
        Get.toNamed(AppRoutes.settingFundPsd);
      }
    }
  }
}
