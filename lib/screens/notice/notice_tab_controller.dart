import 'package:dgpt/models/pulse/notice_info.dart';
import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class NoticeTabController extends BaseController {
  // final TutorialService tutorialService = Get.find();
  //
  final int type;
  // RxList<TutorialInfo> tutorials = <TutorialInfo>[].obs;

  NoticeTabController({required this.type});

  final AiPulseService aiPulseService = Get.find();
  RxList<NoticeInfo> noticeInfoList = <NoticeInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
    print('-----------------');
    noticeUserNoticeList();
  }

  noticeUserNoticeList(
      {AppLoadingState loadingState = AppLoadingState.normal}) async {
    final result = await fetchData(
        loadingState: loadingState,
        request: () => aiPulseService.noticeUserNoticeList(
            type: type));
    if (result != null) {
      print(result);
    }
  }
}
