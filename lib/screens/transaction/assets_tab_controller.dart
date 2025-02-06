import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';

class AssetsTabController extends BaseController {
  // final TutorialService tutorialService = Get.find();
  //
  final String type;
  // RxList<TutorialInfo> tutorials = <TutorialInfo>[].obs;

  AssetsTabController({required this.type});

  @override
  void onInit() {
    super.onInit();
    print(type);
    getTutorials();
  }

  getTutorials(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final page = loadingState == AppLoadingState.loadMore ? currentPage + 1 : 1;
    // final result = await fetchPaginatedData(
    //     loadingState: loadingState,
    //     paginationResponseBuilder: (response) => response?.list,
    //     request: () =>
    //         tutorialService.fetchTutorialList(page: page, type: type));
    // if (result != null && result.list != null) {
    //   if (loadingState == AppLoadingState.loadMore) {
    //     tutorials.addAll(result.list!.list);
    //   } else {
    //     tutorials.assignAll(result.list!.list);
    //   }
    // }
  }
}
