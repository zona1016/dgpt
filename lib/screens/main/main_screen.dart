import 'package:aida/screens/main/main_screen_controller.dart';
import 'package:aida/utils/extensions/context_extension.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColors.primaryColor,
        appBar: BaseAppBar(
          actions: [
            GestureDetector(
              onTap: controller.login,
              child: Text('data'),
            )
          ],
        ),
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri("https://master.d2y6t2vezku3nd.amplifyapp.com/")),
          ),
        )
    );
  }
}
