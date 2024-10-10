import 'package:aida/screens/qr_code/qr_code.dart';
import 'package:aida/screens/qr_code/qr_code_screen_controller.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrCodeScreen extends GetView<QrCodeScreenController> {
  const QrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColors.white,
        appBar: BaseAppBar(

        ),
        body: QRViewExample()
    );
  }
}
