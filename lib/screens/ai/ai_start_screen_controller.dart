import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AiStartScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => AiStartScreenController(), permanent: false, fenix: false);
  }
}

class AiStartScreenController extends BaseController {

  final AuthService authService = Get.find();
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();

  RxList<String> messageList = <String>[].obs;

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
