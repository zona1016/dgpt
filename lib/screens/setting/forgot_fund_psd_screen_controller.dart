import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:get/get.dart';

class ForgotFundPsdScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ForgotFundPsdScreenController(), permanent: false, fenix: false);
  }
}

class ForgotFundPsdScreenController extends BaseController {

  final UserController userController = Get.find();
  final AuthService authService = Get.find();

  @override
  void onInit() {
    super.onInit();
    print('dfdfdf');
    print( userController.userInfo.account ?? '');
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
