import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetUtils {
  static Future<T?> showBaseBottomSheet<T>(
      {required BuildContext context,
        bool isDismissible = true,
        EdgeInsetsGeometry? padding,
        bool isDynamicHeight = false,
        String? title,
        String? cancelTitle,
        bool showCancel = true,
        Color? backgroundColor,
        double? height,
        Widget? child}) {
    return showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Container(
                color: BaseColors.whiteGray,
                width: double.infinity,
                height: isDynamicHeight ? null : height ?? double.infinity,
                constraints: BoxConstraints(maxHeight: Get.height * 0.9),
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Padding(
                  padding: padding ?? const EdgeInsets.fromLTRB(24, 12, 24, 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            height: 44,
                            child: Stack(
                              children: [
                                if (showCancel && cancelTitle != null)
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 6),
                                        child: Text(
                                          cancelTitle,
                                          style: fontMedium.copyWith(
                                              fontSize: 14,
                                              color: context
                                                  .appTheme.weakTextColor),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                Center(
                                    child: Text(
                                      title,
                                      style: fontBold.copyWith(fontSize: 17, color: BaseColors.primaryColor),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      if (child != null) child
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
