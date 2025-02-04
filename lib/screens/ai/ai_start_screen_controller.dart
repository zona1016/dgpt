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

class AiStartScreenController extends BaseController with GetTickerProviderStateMixin {

  final AuthService authService = Get.find();

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();

  GlobalKey containerKey = GlobalKey();

  RxList<String> messageList = <String>[].obs;

  late AnimationController animationController;
  late List<Animation<double>> dotScales;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    if (animationController != null) {
      animationController.dispose();
    }
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  startAnimal() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    dotScales = List.generate(3, (index) {
      final start = index * 0.2;
      return Tween<double>(begin: 0.5, end: 1.2).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(start, start + 0.6, curve: Curves.easeInOut),
        ),
      );
    });
  }

  endAnimal() {
    animationController.dispose();
  }
}
