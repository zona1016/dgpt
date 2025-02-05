import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:get/get.dart';

class ChangePasswordScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance().lazyPut(() => ChangePasswordScreenController(),
        permanent: false, fenix: false);
  }
}

class ChangePasswordScreenController extends BaseController {
  final AuthService authService = Get.find();

  RxString passwordOld = ''.obs;
  RxString passwordNew = ''.obs;
  RxString passwordNewAgain = ''.obs;

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

  login() async {
    final result = await fetchData(
      request: () => authService.changePwd(
          passwordOld: passwordOld.value, passwordNew: passwordNew.value),
    );
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          image: 'assets/images/custom/dio_psd_success.png',
          title: '重置密码成功！',
          desc: '请稍等片刻，即将进入产品主页~',
          showCircularProgressIndicator: true);
      Get.back();
    }

    DialogUtils.showDGPTBaseDialog(
      image: 'assets/images/custom/dio_psd_error.png',
      title: '很抱歉，您的账号已冻结！',
      desc: '请联系官方客服，或重新注册登录~',
      confirmText: '知道了',
      showCircularProgressIndicator: false,
    );
  }
}
