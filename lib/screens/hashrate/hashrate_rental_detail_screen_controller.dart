import 'package:dgpt/models/pulse/hashrate_page_detail.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class HashrateRentalDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HashrateRentalDetailScreenController(),
        permanent: false, fenix: false);
  }
}

class HashrateRentalDetailScreenController extends BaseController {
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
        request: () => aiPulseService.hashratePageDetail(id: args!.hasratePageInfo.id.toString()));
    if (result != null) {
      hashratePageDetail.value = result;
    }
  }
}
