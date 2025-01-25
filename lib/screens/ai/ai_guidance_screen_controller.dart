import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class AiGuidanceScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => AiGuidanceScreenController(), permanent: false, fenix: false);
  }
}

class AiGuidanceScreenController extends BaseController {

  final AuthService authService = Get.find();

  RxBool headerVisible = false.obs;
  RxBool detailVisible = false.obs;
  RxBool otherVisible = false.obs;

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 400), () {
      headerVisible.value = true;
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      detailVisible.value = true;
      otherVisible.value = true;
    });

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
