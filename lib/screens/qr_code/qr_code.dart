import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/foundation.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class QrCode extends StatefulWidget {

  void Function(String? result) callback;
  QrCode({super.key, required this.callback});
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QrCode> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText;

  @override
  void reassemble() {
    super.reassemble();
    if (defaultTargetPlatform == TargetPlatform.android) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
              onPermissionSet: _checkAndRequestCameraPermission,
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    bool isProcessing = false;
    controller.scannedDataStream.listen((scanData) async {
      if (isProcessing) return;
      isProcessing = true;
      widget.callback(scanData.code);
    });
  }

  void _checkAndRequestCameraPermission(QRViewController ctrl, bool p) async {
    PermissionStatus status = await Permission.camera.status;

    if (status.isGranted) {

    } else if (status.isDenied || status.isPermanentlyDenied) {

      final result = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(tr('chat.camera_permission_required')),
          content: Text(tr('chat.camera_access_required_message')),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
                Get.back();
              },
              child: Text(TIM_t('取消')),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context, true);
              },
              child: Text(tr('chat.go_to_settings')),
            ),
          ],
        ),
      );

      if (result == true) {
        // 如果用户选择前往设置
        if (status.isPermanentlyDenied) {
          // 引导用户打开设置
          await openAppSettings();
        } else {
          // 请求权限
          final newStatus = await Permission.camera.request();
          if (newStatus.isGranted) {

          }
        }
      }

    }

  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
