import 'package:dgpt/models/pulse/amount_total_info.dart';
import 'package:dgpt/models/pulse/user_income_total.dart';
import 'package:dgpt/models/pulse/user_team_total_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class IncomeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => IncomeScreenController(), permanent: false, fenix: false);
  }
}

class IncomeScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();

  final double circleHeight = 250.0;
  final double textHeight = 25.0;
  final double dashWidth = 5.0;
  final double dashSpace = 2.0;

  RxDouble totalAmount = 0.0.obs;

  Rxn<UserIncomeTotal> incomeTotal = Rxn<UserIncomeTotal>();
  Rxn<AmountTotalInfo> amountTotalInfo = Rxn<AmountTotalInfo>();
  Rxn<UserTeamTotalInfo> userTeamTotalInfo = Rxn<UserTeamTotalInfo>();

  @override
  void onInit() {
    super.onInit();
    userIncomeTotal();
    aiPulseTotalAmountTotal();
    userTeamDataTotal();
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

  userTeamDataTotal() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.userTeamDataTotal());
    if (result != null) {
      userTeamTotalInfo.value = result;
    }
  }

  aiPulseTotalAmountTotal() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.aiPulseTotalAmountTotal());
    if (result != null) {
      amountTotalInfo.value = result;
      totalAmount.value = (amountTotalInfo.value?.planAmountTotal ?? 0)
          + (amountTotalInfo.value?.directAwardAmountTotal ?? 0)
          + (amountTotalInfo.value?.teamAwardAmountTotal ?? 0)
          + (amountTotalInfo.value?.roiAmountTotal ?? 0);
    }
  }
}
