import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class AiScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => AiScreenController(), permanent: false, fenix: false);
  }
}

class AiScreenController extends BaseController with GetTickerProviderStateMixin {

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
}
