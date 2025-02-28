import 'package:dgpt/utils/packages/toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

import 'package:permission_handler/permission_handler.dart';

class MobileFunctionality {

  Future<void> capturePng(BuildContext context, GlobalKey globalKey) async {
    try {
      // 获取 RenderRepaintBoundary
      RenderRepaintBoundary boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      // 转换为图像
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);

      // 转换为字节数据
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      bool permission = await requestPermission(context);
      if (permission) {
        await ImageGallerySaver.saveImage(pngBytes,
            quality: 100, name: "column_image");
        Get.back();
        ToastUtils.showToast(title: '图片保存成功');
      }
    } catch (e) {
      print(e.toString());
    }
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
}

