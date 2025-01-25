import 'package:dgpt/screens/web/web_screen_controller.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class WebViewScreenArgs {
  final String url;

  WebViewScreenArgs({required this.url});
}

class WebViewScreen extends GetView<WebScreenController> {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const BaseAppBar(
        title: '',
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(controller.args!.url)),
        onWebViewCreated: (controller) {
          Get.context!.loaderOverlay.hide();
        },
        onLoadStart: (controller, url) {
          Get.context!.loaderOverlay.show();
        },
        onLoadStop: (controller, url) async {
          Get.context!.loaderOverlay.hide();
        },
        onProgressChanged: (controller, progress) {
          if (progress > 10) {
            Get.context!.loaderOverlay.hide();
          }
        },
        onReceivedHttpError: (controller, request, errorResponse) {
          Get.context!.loaderOverlay.hide();
        },
      ),
    );
  }
}
