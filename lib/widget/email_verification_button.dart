import 'dart:async';

import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class EmailVerificationButton extends StatelessWidget {
  final EmailVerificationButtonController controller;
  final String type;
  final GlobalKey<FormBuilderState> formKey;

  EmailVerificationButton(
      {super.key, required this.formKey, required this.type})
      : controller = Get.put(EmailVerificationButtonController(type: type));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final email = formKey.currentState?.instantValue['email'] ?? '';
        controller.requestCode(email);
      },
      behavior: HitTestBehavior.opaque,
      child: Obx(() => Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              controller.waitingTime.value <= 0
                  ? tr("button.send_verification_code")
                  : "${controller.waitingTime.value.toString()} s",
              style: fontMedium.copyWith(
                  fontSize: 14, color: BaseColors.primaryColor),
            ),
          )),
    );
  }
}

class EmailVerificationButtonController extends BaseController {
  final AuthService authService = Get.find();
  String type;
  Timer? timer;
  RxInt waitingTime = 0.obs;

  EmailVerificationButtonController({required this.type});

  requestCode(String email) async {
    if (waitingTime.value > 0) {
      return;
    }
    if (email.isEmpty) {
      DialogUtils.showErrorDialog(tr("error.please_enter_email"));
      return;
    }
    // final result = await fetchData(
    //     request: () =>
    //         authService.sendEmailVerification(type: type, email: email));
    // if (result != null) {
    //   DialogUtils.showSuccessDialog(tr("msg.email_verification_code_sent"));
    //   waitingTime.value = result.waitingTime;
    //   if (waitingTime.value != 0) {
    //     startTimer();
    //   }
    // }
  }

  startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (waitingTime.value <= 0) {
        timer.cancel();
      } else {
        waitingTime.value--;
      }
    });
  }
}
