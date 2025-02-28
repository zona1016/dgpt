import 'dart:async';

import 'dart:html' as html;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class WebFunctionality {

  Future<void> capturePngWeb(BuildContext context, GlobalKey globalKey) async {
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

      // 创建 Blob 并生成下载链接
      final blob = html.Blob([pngBytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "column_image.png")
        ..click();

      // 释放 URL
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      print("Error: $e");
    }
  }

  static bool isMobile() {
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    return userAgent.contains('mobile') || userAgent.contains('android') || userAgent.contains('iphone');
  }
}

