import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/widget/form/menu_item.dart';
import 'package:get/get.dart';

class TaskHistoryScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => TaskHistoryScreenController(),
        permanent: false, fenix: false);
  }
}

class TaskHistoryScreenController extends BaseController {
  final AuthService authService = Get.find();

  RxList<MenuItem> historyTypes = <MenuItem>[].obs;

  @override
  void onInit() {
    super.onInit();

    historyTypes.value = [
      MenuItem(label: '1', value: '9'),
      MenuItem(label: '2', value: '8'),
      MenuItem(label: '3', value: '7'),
      MenuItem(label: '4', value: '6'),
      MenuItem(label: '5', value: '5'),
      MenuItem(label: '6', value: '4'),
    ];
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
