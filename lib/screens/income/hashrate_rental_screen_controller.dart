import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/widget/form/menu_item.dart';
import 'package:get/get.dart';

class HashrateRentalScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => HashrateRentalScreenController(),
        permanent: false, fenix: false);
  }
}

class HashrateRentalScreenController extends BaseController {
  final AuthService authService = Get.find();

  var progress = 0.5.obs;  // 50% progress
  var totalUsers = 65.obs;
  var currentUsers = 3.obs;

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
