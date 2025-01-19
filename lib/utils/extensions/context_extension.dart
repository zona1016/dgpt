import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension ContextExtension on BuildContext {
  AppTheme get appTheme => AppTheme();

  copyText(String text) async {
    if (mounted) {
      await Clipboard.setData(
        ClipboardData(text: text),
      ).then((value) {
        FToast fToast = FToast();
        fToast.init(this);
        ToastUtils.showToast(title: tr('msg.copied'), fToast: fToast);
      });
    }
  }
}
