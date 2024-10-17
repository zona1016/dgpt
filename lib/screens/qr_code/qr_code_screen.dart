import 'package:aida/screens/main/main_screen_controller.dart';
import 'package:aida/screens/qr_code/qr_code.dart';
import 'package:aida/screens/qr_code/qr_code_screen_controller.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum QrCodeType {webScan, profileScan}

class QrCodeScreenArgs {
  final QrCodeType type;
  QrCodeScreenArgs({required this.type});
}

class QrCodeScreen extends GetView<QrCodeScreenController> {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColors.white,
        appBar: const BaseAppBar(

        ),
        body: QRViewExample(
          callback: (result) async {
            QrCodeType type = controller.args!.type;

            switch (type) {
              case QrCodeType.webScan:
                MainScreenController mainScreenController = Get.find<MainScreenController>();
                await mainScreenController.webViewController?.evaluateJavascript(
                    source: 'window["webViewHandler"]("$result")');
              case QrCodeType.profileScan:
                print(result);
              default:
            }
          },
        )
    );
  }
}
