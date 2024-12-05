import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class HelpScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut<HelpScreenController>(
            () => HelpScreenController(),
        fenix: false,
        permanent: false);
  }
}

class HelpScreenController extends BaseController {


  @override
  void onInit() {
    super.onInit();

  }

}
