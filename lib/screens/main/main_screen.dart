import 'package:aida/screens/main/main_screen_controller.dart';
import 'package:aida/utils/routes/app_routes.dart';
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
        backgroundColor: BaseColors.white,
        appBar: BaseAppBar(
          actions: [
            GestureDetector(
              onTap: controller.login,
              child: const Text('data'),
            )
          ],
        ),
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri("https://master.d2y6t2vezku3nd.amplifyapp.com/")),
            onWebViewCreated: (webController) {
              controller.webViewController = webController;
              // 注册 JavaScript Handler
              webController.addJavaScriptHandler(
                handlerName: 'onMessageReceived',
                callback: (args) {
                  // args 是从 JavaScript 传递的消息，通常是一个列表
                  if (args.isNotEmpty) {
                    String message = args[0]; // 获取传递的第一个参数
                  }
                  Get.toNamed(AppRoutes.qrCode);
                },
              );

            },
            onLoadStop: (controller, url) {
              // 注入一个JS方法，监听postMessage的调用
              controller.evaluateJavascript(source: """
                window.scriptHandler = {
                  postMessage: function(message) {
                    window.flutter_inappwebview.callHandler('onMessageReceived', message);
                  }
                };
              """);
            }
          ),
        )
    );
  }
}
