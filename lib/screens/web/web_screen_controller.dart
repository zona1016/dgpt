import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class WebScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => WebScreenController(),
        permanent: false, fenix: true);
  }
}

class WebScreenController extends BaseController {

  @override
  void onInit() {
    super.onInit();

  }
}
