import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class GoogleTipScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => GoogleTipScreenController(),
        permanent: false, fenix: true);
  }
}

class GoogleTipScreenController extends BaseController {

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
    super.onReady();
  }
}
