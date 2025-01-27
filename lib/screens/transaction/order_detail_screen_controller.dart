import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class OrderDetailScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => OrderDetailScreenController(),
        permanent: false, fenix: false);
  }
}

class OrderDetailScreenController extends BaseController {
  final AuthService authService = Get.find();

  List<String> itemList = [
    'Deployment nodes',
    'SN.',
    'Creation time',
    'Deployment time',
    'Expire date',
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
