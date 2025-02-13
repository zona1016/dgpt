import 'package:dgpt/models/pulse/amount_total_info.dart';
import 'package:dgpt/models/pulse/user_income_total.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class SalaryScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => SalaryScreenController(), permanent: false, fenix: false);
  }
}

class SalaryScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();

  Rxn<UserIncomeTotal> incomeTotal = Rxn<UserIncomeTotal>();
  Rxn<AmountTotalInfo> amountTotalInfo = Rxn<AmountTotalInfo>();

  @override
  void onInit() {
    super.onInit();
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

  userIncomeTotal() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.userIncomeTotal());
    if (result != null) {
      incomeTotal.value = result;
    }
  }

  aiPulseTotalAmountTotal() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseTotalAmountTotal());
    if (result != null) {
      amountTotalInfo.value = result;
    }
  }
}
