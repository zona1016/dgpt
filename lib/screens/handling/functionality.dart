import 'package:dgpt/screens/handling/mobile_functionality.dart';
// import 'package:dgpt/screens/handling/web_functionality.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Functionality {
  static void downloadImage(
      {required BuildContext context, required GlobalKey globalKey}) {
    if (kIsWeb) {
      // WebFunctionality().capturePngWeb(context, globalKey);
    } else {
      MobileFunctionality().capturePng(context, globalKey);
    }
  }

  static bool isMobile() {
    if (kIsWeb) {
      return false;
      // return WebFunctionality.isMobile();
    } else {
      return true;
    }
  }
}
