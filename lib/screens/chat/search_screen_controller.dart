import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class SearchScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => SearchScreenController(), permanent: false, fenix: false);
  }
}

class SearchScreenController extends BaseController {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

}
