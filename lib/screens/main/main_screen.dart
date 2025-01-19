import 'package:dgpt/screens/main/main_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'dart:convert'; // 用于 JSON 解析
import 'dart:typed_data';

import 'package:permission_handler/permission_handler.dart'; // 用于处理二进制数据

/// 正式线 https://prod.d2y6t2vezku3nd.amplifyapp.com/
/// 测试线 https://master.d2y6t2vezku3nd.amplifyapp.com/
class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Container(color: Colors.red,));
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
                openAppSettings(); // 打开系统设置页面
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

    await ImageGallerySaver.saveImage(bytes,
        name: "image_${DateTime.now().millisecondsSinceEpoch}");
  }
}
