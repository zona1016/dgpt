import 'package:dgpt/screens/handling/functionality.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeUtil {
  /// 返回符合指定宽高比的 Size
  static Size getAspectRatioSize({double aspectRatio = 9 / 16}) {

    if (kIsWeb) {
      // if (Functionality.isMobile()) {
      //   return Get.size;
      // }
      double width = Get.size.width;
      double height = Get.size.height;

      // 计算出限制的最大宽度和高度
      double desiredWidth = height * aspectRatio;
      double desiredHeight = width / aspectRatio;

      // 选择适合屏幕的最大尺寸
      double finalWidth = width > desiredWidth ? desiredWidth : width;
      double finalHeight = height > desiredHeight ? desiredHeight : height;

      return Size(finalWidth, finalHeight);
    } else {
      return Get.size;
    }
  }

  static double width() {
    return getAspectRatioSize().width;
  }

  static double height() {
    return getAspectRatioSize().height;
  }
}
