
import 'package:aida/utils/constants/app_default_size.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
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
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: gap, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(colors: [
              BaseColors.primaryGradientStartColor,
              BaseColors.primaryGradientEndColor
            ])),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon ??
                Image.asset(
                  "assets/image/icons/ic_rounded_check.png",
                  width: 14,
                ),
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
