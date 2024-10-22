import 'package:aida/models/web/web_message_received_info.dart';
import 'package:aida/screens/main/main_screen_controller.dart';
import 'package:aida/screens/qr_code/qr_code_screen.dart';
import 'package:aida/utils/packages/toast.dart';
import 'package:aida/utils/routes/app_routes.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/widget/base/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'dart:convert'; // 用于 JSON 解析
import 'dart:io'; // 用于文件操作
import 'dart:typed_data'; // 用于处理二进制数据
import 'package:path_provider/path_provider.dart';
import 'package:tencent_calls_uikit/tencent_calls_uikit.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: BaseColors.white,
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri("https://master.d2y6t2vezku3nd.amplifyapp.com/")),
            onWebViewCreated: (webController) {
              controller.webViewController = webController;
              // 注册 JavaScript Handler
              webController.addJavaScriptHandler(
                handlerName: 'onMessageReceived',
                callback: (args) async {
                  if (args.isNotEmpty) {
                    Map<String, dynamic> parsedMessage = jsonDecode(args.first);
                    WebMessageReceivedInfo info = WebMessageReceivedInfo.fromJson(parsedMessage);
                    WebMessageReceivedInfoType? infoType = info.data.stringToEnum(info.data.type);
                    if (infoType == WebMessageReceivedInfoType.qrScan) {
                      // 二维码扫描
                      Get.toNamed(AppRoutes.qrCode, arguments: QrCodeScreenArgs(type: QrCodeType.webScan));
                    } else if (infoType == WebMessageReceivedInfoType.downLoadImg) {
                      // 下载图片
                      if (info.data.base64 != null) {

                        bool permission = await requestPermission(context);
                        if (permission) {
                          if (info.data.base64!.contains("data:image")) {
                            info.data.base64 = info.data.base64!.split(",").last;
                          }
                          await saveImageFromBase64(info.data.base64!);
                          ToastUtils.showToast(title: '图片保存成功');
                        }
                      }
                    } else if (infoType == WebMessageReceivedInfoType.toMessage) {
                      if (info.data.chatUserId != null && info.data.chatUserSig != null) {
                        final result =  await TUICallKit.instance.login(20002781,
                            info.data.chatUserId!,
                            info.data.chatUserSig!);
                        if (result.code == '0') {
                          Get.toNamed(AppRoutes.conversation);
                        } else {
                          ToastUtils.showToast(title: result.message ?? '');
                        }
                      }
                    }
                  }
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

  // 请求权限的函数
  Future<bool> requestPermission(BuildContext context) async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      // 权限被拒绝时，提示用户授予权限
      _showPermissionDeniedDialog(context);
    } else if (status.isPermanentlyDenied) {
      // 用户选择了 "Don't ask again"，引导用户到设置页面
      _showOpenSettingsDialog(context);
    }

    return false;
  }

// 弹窗提示用户授予权限
  void _showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('权限被拒绝'),
          content: const Text('请授予存储权限以保存图片到相册。'),
          actions: <Widget>[
            TextButton(
              child: const Text('关闭'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

// 弹窗引导用户手动打开设置页面
  void _showOpenSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('权限被永久拒绝'),
          content: const Text('请在设置中手动开启存储权限。'),
          actions: <Widget>[
            TextButton(
              child: const Text('前往设置'),
              onPressed: () {
                openAppSettings();  // 打开系统设置页面
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('关闭'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> saveImageFromBase64(String base64Image) async {

    Uint8List bytes = base64Decode(base64Image);

    await ImageGallerySaver.saveImage(bytes, name: "image_${DateTime.now().millisecondsSinceEpoch}");
  }
}
