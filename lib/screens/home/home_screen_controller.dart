import 'dart:async';

import 'package:dgpt/services/ai_pulse_service.dart';
import 'package:dgpt/services/auth_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dgpt/utils/constants/app_enums.dart';
import 'package:dgpt/utils/controllers/base_controller.dart';
import 'package:dgpt/utils/controllers/user_controller.dart';
import 'package:dgpt/utils/dialog.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:ui' as ui;

import 'package:permission_handler/permission_handler.dart';

class HomeScreenBindings implements Bindings {
  @override
  void dependencies() {
    GetInstance()
        .lazyPut(() => HomeScreenController(), permanent: false, fenix: false);
  }
}

class HomeScreenController extends BaseController {
  final AuthService authService = Get.find();
  final AiPulseService aiPulseService = Get.find();
  final UserController userController = Get.find();
  GlobalKey globalKey = GlobalKey();

  final selectedBannerIndex = 0.obs;
  CarouselSliderController carouselSliderController =
      CarouselSliderController();
  late Timer _timer;

  List<String> titles = ['通告', '邀请', '教学', '企业'];
  List<String> images = [
    'assets/images/home/tg.png',
    'assets/images/home/yq.png',
    'assets/images/home/jx.png',
    'assets/images/home/qy.png'
  ];

  @override
  void onInit() {
    super.onInit();
    aiPulseBanner();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
    //     if (selectedBannerIndex < 3) {
    //       carouselSliderController.nextPage();
    //     } else {
    //       carouselSliderController.jumpToPage(0);
    //     }
    //   });
    // });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    ToastUtils.init(Get.context!);
  }

  aiPulseBanner(
      {AppLoadingState loadingState = AppLoadingState.background}) async {
    final page = loadingState == AppLoadingState.loadMore ? currentPage + 1 : 1;
    final result = await fetchPaginatedData(
        loadingState: loadingState,
        request: () => aiPulseService.aiPulseDeposit(page: page));
    if (result != null && result.list != null) {}
  }

  Future<void> capturePng(BuildContext context) async {
    try {
      // 获取 RenderRepaintBoundary
      RenderRepaintBoundary boundary =
      globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

      // 转换为图像
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);

      // 转换为字节数据
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      bool permission = await requestPermission(context);
      if (permission) {
        await ImageGallerySaver.saveImage(pngBytes, quality: 100, name: "column_image");
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

  logout() async {
    final result = await fetchData(
        loadingState: AppLoadingState.normal,
        request: () => authService.logout());
    if (result != null) {
      DialogUtils.showDGPTBaseDialog(
          title: '退出成功！', desc: '', confirmText: '确定', onConfirmPressed: () {
        Get.back();
        userController.clearUser();
      });
    }
  }
}
