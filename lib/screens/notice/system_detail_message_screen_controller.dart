import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class SystemDetailMessageScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => SystemDetailMessageScreenController(),
        permanent: false, fenix: false);
  }
}

class SystemDetailMessageScreenController extends BaseController {
  final AuthService authService = Get.find();

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
