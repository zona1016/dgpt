import 'package:aida/models/user/user_info.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:get/get.dart';

class NewContactScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => NewContactScreenController(), permanent: false, fenix: false);
  }
}

class NewContactScreenController extends BaseController {

  UserInfo? userInfo;

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
    ToastUtils.init(Get.context!);
  }

}
