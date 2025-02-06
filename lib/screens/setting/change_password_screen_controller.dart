import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class ChangePasswordScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ChangePasswordScreenController(), permanent: false, fenix: false);
  }
}

class ChangePasswordScreenController extends BaseController {

  final AuthService authService = Get.find();

  RxString oldPsd = ''.obs;
  RxString newPsd = ''.obs;
  RxString newPsdAgain = ''.obs;

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

  conform() {

  }

}
