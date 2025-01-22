import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class LoginScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => LoginScreenController(), permanent: false, fenix: false);
  }
}

class LoginScreenController extends BaseController {

  final AuthService authService = Get.find();

  String userName = '';
  String password = '';

  RxBool canLogin = false.obs;

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
