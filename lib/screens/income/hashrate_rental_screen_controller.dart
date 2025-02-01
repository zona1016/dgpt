import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class HashrateRentalScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HashrateRentalScreenController(),
        permanent: false, fenix: false);
  }
}

class HashrateRentalScreenController extends BaseController {
  final AiPulseService authService = Get.find();

  var progress = 0.5.obs;  // 50% progress
  var totalUsers = 65.obs;
  var currentUsers = 3.obs;
  RxBool dddd = false.obs;

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
        loadingState: AppLoadingState.normal,
        request: () => authService.userHashrate());
    if (result != null) {
      print(result);
    }
  }
}
