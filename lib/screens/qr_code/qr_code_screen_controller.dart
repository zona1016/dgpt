import 'package:aida/screens/qr_code/qr_code_screen.dart';
import 'package:aida/utils/controllers/base_controller.dart';
import 'package:get/get.dart';

class QrCodeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => QrCodeScreenController(), permanent: false, fenix: false);
  }
}

class QrCodeScreenController extends BaseController<QrCodeScreenArgs> {

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

}
