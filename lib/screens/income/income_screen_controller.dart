import 'package:dgpt/models/pulse/power_info.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class IncomeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => IncomeScreenController(), permanent: false, fenix: false);
  }
}

class IncomeScreenController extends BaseController {

  final AuthService authService = Get.find();

  final double circleHeight = 250.0;
  final double textHeight = 25.0;
  final double dashWidth = 5.0;
  final double dashSpace = 2.0;

  var totalEarnings = 100000.obs; // 总收益
  var activeMembers = 80.obs; // 激活人数
  var totalMembers = 100.obs; // 总人数

  var earningsDetails = {
    '算力租借': 5000.obs,
    '团队算力奖': 20000.obs,
    '邀请奖': 3000.obs,
    '薪资': 15000.obs,
  }.obs;

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
