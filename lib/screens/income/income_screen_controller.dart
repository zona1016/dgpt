import 'package:dgpt/models/pulse/amount_total_info.dart';
import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/models/pulse/user_income_total.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
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

  Rxn<UserIncomeTotal> incomeTotal = Rxn<UserIncomeTotal>();
  Rxn<AmountTotalInfo> amountTotalInfo = Rxn<AmountTotalInfo>();

  var totalEarnings = 100000.obs; // 总收益
  var activeMembers = 80.obs; // 激活人数
  var totalMembers = 100.obs; // 总人数

  var earningsDetails = {
    '算力租借': 5000.obs,
    '团队算力奖': 20000.obs,
    '邀请奖': 3000.obs,
    '薪资': 15000.obs,
  }.obs;

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
