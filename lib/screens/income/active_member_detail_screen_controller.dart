import 'package:dgpt/models/pulse/layer_hashrate_info.dart';
import 'package:dgpt/models/pulse/plan_detail.dart';
import 'package:dgpt/models/pulse/re_user_info.dart';
import 'package:dgpt/screens/income/active_member_detail_screen.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class ActiveMemberDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => ActiveMemberDetailScreenController(),
        permanent: false, fenix: false);
  }
}

class ActiveMemberDetailScreenController extends BaseController<ActiveMemberDetailScreenArgs> {
  final AiPulseService aiPulseService = Get.find();

  Rxn<MemberList> memberList = Rxn<MemberList>();
  Rxn<ReUserInfo> reUserInfo = Rxn<ReUserInfo>();
  RxList<PlanDetail> planDetailList = <PlanDetail>[].obs;

  @override
  void onInit() {
    super.onInit();
    memberList.value = args!.memberList;
    userRecommandUserInfo();
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


  userRecommandUserInfo() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => aiPulseService.userRecommandUserInfo(userId: args!.memberList?.user?.id ?? 0));
    if (result != null) {
      reUserInfo.value = result;
      aiPulseUserPlanUserPlan();
    }
  }

  aiPulseUserPlanUserPlan(
      {AppLoadingState loadingState = AppLoadingState.normal}) async {
    final result = await fetchData(
        request: () => aiPulseService.aiPulseUserPlanUserPlan(userId: args!.memberList?.user?.id ?? 0),
        loadingState: AppLoadingState.background);
    if (result != null && result.isNotEmpty) {
      planDetailList.value = result;
    }
  }
}
