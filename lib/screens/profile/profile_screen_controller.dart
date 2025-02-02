import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class ProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ProfileScreenController(), permanent: false, fenix: false);
  }
}

class ProfileScreenController extends BaseController {

  final AuthService authService = Get.find();

  List<String> profileList = [
    'My Device',
    'My Team',
    'My Orders',
    'Share',
    'KYC',
    'Customer Service',
    'Task Center',
    'Computing Pool',
    'Language Selection',
    'About Us',
    'Logout'
  ];

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
