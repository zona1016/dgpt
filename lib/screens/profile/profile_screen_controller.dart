import 'dart:async';

import 'package:dgpt/services/auth_service.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

import 'package:permission_handler/permission_handler.dart';

class ProfileScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => ProfileScreenController(), permanent: false, fenix: false);
  }
}

class ProfileScreenController extends BaseController {

  final AuthService authService = Get.find();
  final UserController userController = Get.find();
  GlobalKey globalKey = GlobalKey();

  List<String> profileActionTitles = [
    tr('profile.computing_power_wallet'),
    tr('profile.cash_wallet'),
    tr('profile.withdraw'),
  ];

  List<String> profileActionImages = [
    'assets/images/custom/profile_slqb.png',
    'assets/images/custom/profile_xjqb.png',
    'assets/images/custom/profile_tk.png',
  ];

  List<String> profileTitles = [
    tr('profile.my_orders'),
    tr('profile.share'),
    'KYC',
    tr('profile.customer_service'),
    tr('profile.language_selection'),
    tr('profile.about_us'),
  ];

  List<String> profileImages = [
    'assets/images/custom/profile_wddd.png',
    'assets/images/custom/profile_fx.png',
    'assets/images/custom/profile_kyc.png',
    'assets/images/custom/profile_kf.png',
    'assets/images/custom/profile_yyxz.png',
    'assets/images/custom/profile_gywm.png',
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  Future<void> capturePng(BuildContext context) async {
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
