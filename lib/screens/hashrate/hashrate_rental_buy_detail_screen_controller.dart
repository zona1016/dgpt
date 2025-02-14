import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/screens/hashrate/hashrate_rental_buy_detail_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:easy_localization/easy_localization.dart';
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
  RxInt continueDay = 0.obs;
  RxInt total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    planDetail.value = args!.planDetail;

    DateTime sysDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(planDetail.value?.sysNowTime ?? '');
    DateTime beginDateObj = DateFormat("yyyy-MM-dd HH:mm:ss").parse(planDetail.value?.beginDate ?? '');
    continueDay.value = sysDate.difference(beginDateObj).inDays;
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
