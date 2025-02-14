import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/screens/hashrate/hashrate_password_input_screen.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_buy_detail_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:get/get.dart';

class HashrateRentalBuyDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HashrateRentalBuyDetailScreenController(),
        permanent: false, fenix: false);
  }
}

class HashrateRentalBuyDetailScreenController extends BaseController<HashrateRentalBuyDetailScreenArgs> {
  final AiPulseService aiPulseService = Get.find();

  RxString dd = 'dd'.obs;
  Rxn<PlanDetail> planDetail = Rxn<PlanDetail>();

  RxInt total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    planDetail.value = args!.planDetail;
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
}
