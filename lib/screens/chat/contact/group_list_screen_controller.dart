import 'package:aida/models/user/user_info.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:get/get.dart';

class GroupListScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => GroupListScreenController(), permanent: false, fenix: false);
  }
}

class GroupListScreenController extends BaseController {

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
