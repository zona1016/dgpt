import 'package:dgpt/models/pulse/amount_total_info.dart';
import 'package:dgpt/models/pulse/user_income_total.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';

class InvitationAwardScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => InvitationAwardScreenController(), permanent: false, fenix: false);
  }
}

class InvitationAwardScreenController extends BaseController {

  final AiPulseService aiPulseService = Get.find();

  List<String> actionTitles = [
    tr('profile.computing_power_wallet'),
    tr('profile.cash_wallet'),
  ];

  List<String> actionImages = [
    'assets/images/custom/profile_slqb.png',
    'assets/images/custom/profile_xjqb.png',
  ];

  Rxn<UserIncomeTotal> incomeTotal = Rxn<UserIncomeTotal>();
  Rxn<AmountTotalInfo> amountTotalInfo = Rxn<AmountTotalInfo>();

  @override
  void onInit() {
    super.onInit();
    userIncomeTotal();
    aiPulseTotalAmountTotal();
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
