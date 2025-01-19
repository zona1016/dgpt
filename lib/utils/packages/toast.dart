import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  ToastUtils._();

  static final _fToast = FToast();

  static init(BuildContext context) async {
    return _fToast.init(context);
  }

  static void showToast({required String title, Widget? icon, FToast? fToast}) {
    (fToast ?? _fToast).showToast(
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: gap, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          color: BaseColors.weakTextColor
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 5),
            Text(title,
                style: fontMedium.copyWith(
                    fontSize: 14, height: 1, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
