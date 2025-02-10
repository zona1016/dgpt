import 'package:dgpt/utils/api/api_exception.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static void showBaseDialog(
      {bool barrierDismissible = true,
      required String title,
      String? desc,
      String? underlinedText,
      String? image,
      Widget? imageWidget,
      final void Function()? onUnderLinedTextClicked,
      final void Function()? onConfirmPressed,
      final void Function()? onCancelPressed,
      Widget? child,
      String? confirmText,
      String? cancelText}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    showDialog<void>(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          shadowColor: Colors.transparent,
          backgroundColor: context.appTheme.lightPrimaryColor,
          surfaceTintColor: context.appTheme.lightPrimaryColor,
          contentPadding: const EdgeInsets.all(28),
          content: SizedBox(
            width: Get.width * 0.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                imageWidget ?? Container(),
                if (image != null)
                  FractionallySizedBox(
                      widthFactor: 0.25,
                      child: Image.asset("assets/images/$image.png")),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: fontBold.copyWith(
                      fontSize: 17, color: context.appTheme.textColor),
                ),
                if (desc != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      desc,
                      textAlign: TextAlign.center,
                      style: fontRegular.copyWith(
                          fontSize: 12, color: context.appTheme.weakTextColor),
                    ),
                  ),
                if (underlinedText != null)
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onUnderLinedTextClicked?.call(),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        underlinedText,
                        textAlign: TextAlign.center,
                        style: fontMedium.copyWith(
                            fontSize: 14,
                            color: BaseColors.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: BaseColors.primaryColor),
                      ),
                    ),
                  ),
                if (child != null) child,
                const SizedBox(height: 25),
                FractionallySizedBox(
                  widthFactor:
                      confirmText != null && cancelText != null ? 1 : 0.6,
                  child: Row(
                    children: [
                      if (confirmText != null)
                        Expanded(
                            flex: 3,
                            child: BaseButton(
                              onPressed: () {
                                onConfirmPressed?.call();
                              },
                              text: confirmText,
                            )),
                      if (confirmText != null && cancelText != null)
                        const SizedBox(width: 10),
                      if (cancelText != null)
                        Expanded(
                            flex: 2,
                            child: BaseButton(
                                type: BaseButtonType.secondary,
                                onPressed: () {
                                  onCancelPressed?.call();
                                },
                                text: cancelText)),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static void showDGPTBaseDialog(
      {bool barrierDismissible = true,
      BorderRadiusGeometry? comBorderRadius,
      required String title,
      Color? titleColor,
      String? topTitle,
      Color? topTitleColor,
      LinearGradient? gradient,
      String? desc,
      String? image,
      bool showBottomClose = false,
      Widget? imageWidget,
      Color? contentColor,
      bool showCircularProgressIndicator = false,
      Color? progressIndicatorColor,
      final void Function()? onConfirmPressed,
      final void Function()? onCancelPressed,
      Widget? child,
      String? confirmText,
      String? cancelText}) async {
    await Future.delayed(const Duration(milliseconds: 100));
    showDialog<void>(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(defaultPadding * 1.5)
                    .copyWith(top: defaultPadding * 2),
                decoration: BoxDecoration(
                    gradient: gradient ?? BaseColors.appBarLinearGradient,
                    borderRadius: BorderRadius.circular(10)),
                width: Get.width * 0.6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (topTitle != null && topTitle.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: defaultPadding),
                        child: Text(
                          topTitle,
                          textAlign: TextAlign.center,
                          style: fontDMMedium.copyWith(
                              fontSize: 24,
                              color: topTitleColor ?? BaseColors.white),
                        ),
                      ),
                    imageWidget ?? Container(),
                    if (title.isNotEmpty && imageWidget != null)
                      const SizedBox(
                        height: defaultPadding,
                      ),
                    if (title.isNotEmpty)
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: fontDMBold.copyWith(
                            fontSize: 18,
                            color: titleColor ?? BaseColors.white),
                      ),
                    if (desc != null)
                      Padding(
                        padding: const EdgeInsets.only(top: defaultPadding / 2),
                        child: Text(
                          desc,
                          textAlign: TextAlign.center,
                          style: fontDMRegular.copyWith(
                              fontSize: 14, color: BaseColors.white),
                        ),
                      ),
                    if (child != null) child,
                    if (confirmText != null || cancelText != null)
                      const SizedBox(height: 20),
                    FractionallySizedBox(
                      widthFactor:
                          confirmText != null && cancelText != null ? 1 : 0.6,
                      child: Row(
                        children: [
                          if (confirmText != null && cancelText != null)
                            const SizedBox(width: 10),
                          if (cancelText != null)
                            Expanded(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: () => Get.back(),
                                  child: Text(
                                    cancelText,
                                    style: fontSFProRegular.copyWith(
                                        fontSize: 14,
                                        color: BaseColors.primaryColor),
                                  ),
                                )),
                          if (confirmText != null)
                            Expanded(
                                flex: 3,
                                child: BaseButton(
                                  customDecoration: BoxDecoration(
                                      color: BaseColors.white.withOpacity(0.2),
                                      borderRadius: comBorderRadius ??
                                          BorderRadius.circular(30)),
                                  height: 35,
                                  onPressed: () {
                                    onConfirmPressed?.call();
                                  },
                                  text: confirmText,
                                )),
                        ],
                      ),
                    ),
                    if (showCircularProgressIndicator)
                      Padding(
                        padding: const EdgeInsets.only(top: defaultPadding),
                        child: CircularProgressIndicator(
                          color: progressIndicatorColor ??
                              BaseColors.primaryColor, // 颜色
                          strokeWidth: 4.0, // 圆圈线条宽度
                        ),
                      )
                  ],
                ),
              ),
              if (showBottomClose)
                Positioned(
                    bottom: -60,
                    left: defaultPadding,
                    right: defaultPadding,
                    child: SizedBox(
                      height: 60,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent,
                              border: Border.all(
                                  color: BaseColors.white, width: 1)),
                          child: const Icon(
                            Icons.close,
                            size: 40.0,
                            color: BaseColors.white,
                          ),
                        ),
                      ),
                    )),
              if (image != null)
                Positioned(
                    top: -115 + defaultPadding * 2.5,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      image,
                      width: 230,
                      height: 230,
                    ))
            ],
          ),
        );
      },
    );
  }

  static void showComingSoonDialog() {
    showBaseDialog(
      title: tr("general.coming_soon"),
      imageWidget: Builder(
        builder: (context) => FractionallySizedBox(
            widthFactor: 0.3,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Image.asset(context.appTheme.comingSoonImg),
            )),
      ),
      confirmText: tr("button.confirm"),
      onConfirmPressed: () {
        Get.back();
      },
    );
  }

  static void showGWComingSoonDialog() {
    showDGPTBaseDialog(
      title: tr("general.coming_soon"),
      imageWidget: Builder(
        builder: (context) => FractionallySizedBox(
            widthFactor: 0.3,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Image.asset(context.appTheme.comingSoonImg),
            )),
      ),
      confirmText: tr("button.confirm"),
      onConfirmPressed: () {
        Get.back();
      },
    );
  }

  static void showAIEnhancementsInProgress() {
    showBaseDialog(
      title: tr("general.ai_enhancements_in_progress"),
      imageWidget: Builder(
        builder: (context) => FractionallySizedBox(
            widthFactor: 0.3,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Image.asset(context.appTheme.comingSoonImg),
            )),
      ),
      confirmText: tr("button.confirm"),
      onConfirmPressed: () {
        Get.back();
      },
    );
  }

  static void showConfirmationDialog(String title,
      {String? desc, Function()? onConfirmPressed, bool showCancel = true}) {
    showBaseDialog(
        title: title,
        desc: desc,
        confirmText: tr("button.confirm"),
        cancelText: showCancel ? tr("button.cancel") : null,
        onCancelPressed: () => Get.back(),
        onConfirmPressed: onConfirmPressed);
  }

  static void showSuccessDialog(String title,
      {Color? titleColor,
      String? topImage,
      BorderRadiusGeometry? comBorderRadius,
      String? topTitle,
      String? desc,
      bool barrierDismissible = true,
      bool showCircularProgressIndicator = false,
      LinearGradient? gradient,
      String? image,
      double? height,
      double? width,
      String? confirmText,
      String? underlinedText,
      Function()? onConfirmPressed,
      Function()? onUnderLinedTextClicked}) {
    showDGPTBaseDialog(
        imageWidget: Image.asset(
          image ?? 'assets/images/custom/dio_login_success.png',
          height: height ?? 44,
          width: width ?? 144,
        ),
        title: title,
        image: topImage,
        topTitle: topTitle,
        titleColor: titleColor,
        barrierDismissible: barrierDismissible,
        desc: desc ?? '请稍等片刻，即将进入产品主页~',
        showCircularProgressIndicator: showCircularProgressIndicator,
        confirmText: confirmText,
        comBorderRadius: comBorderRadius,
        onConfirmPressed: onConfirmPressed,
        gradient: gradient);
  }

  static void showErrorDialog(title,
      {bool barrierDismissible = true,
      String? confirmText,
      Function()? onConfirmPressed}) {
    showDGPTBaseDialog(title: title);
  }

  static void showApiExceptionDialog(Exception e) {
    debugPrint(e.toString());
    String msg = switch (e) {
      TimeOutException() => tr("error.connection_timeout"),
      NoInternetException() => tr("error.no_internet_connection"),
      CancelExecption() => "",
      ServerResponseException() => e.response.msg,
      ApiUnknownException() || Exception() => tr("error.unknown_error"),
    };

    if (msg.isNotEmpty) {
      if (msg.contains('W100000')) {
        // 余额不足
        showRecharge();
      } else {
        showErrorDialog(msg);
      }
    }
  }

  static void showRecharge() {
    DialogUtils.showSuccessDialog('余额不足',
        titleColor: Colors.red,
        width: 200,
        height: 170,
        comBorderRadius: BorderRadius.circular(10),
        gradient: BaseColors.diaYebz,
        image: 'assets/images/custom/dia_yebz.png',
        desc: '钱包余额不足，请立即充值',
        barrierDismissible: false,
        confirmText: '立马充值', onConfirmPressed: () {
      Get.back();
      Get.toNamed(AppRoutes.rechargeDetail);
    });
  }

  static void showRechargeSuccess() {
    DialogUtils.showSuccessDialog('恭喜 ！',
        topTitle: '充值成功',
        width: 200,
        height: 151,
        comBorderRadius: BorderRadius.circular(10),
        gradient: BaseColors.diaCzcg,
        image: 'assets/images/custom/dia_czcg.png',
        desc: '您已成功充值！',
        barrierDismissible: false,
        confirmText: 'OK', onConfirmPressed: () {
      Get.back();
    });
  }

  static void showRechargeFail() {
    DialogUtils.showSuccessDialog('不好了 ！',
        topTitle: '充值失败',
        width: 200,
        height: 151,
        comBorderRadius: BorderRadius.circular(10),
        gradient: BaseColors.diaCzsb,
        image: 'assets/images/custom/dia_czsb.png',
        desc: '看来存款过程被中断了。请稍后再试！',
        barrierDismissible: false,
        confirmText: 'OK', onConfirmPressed: () {
      Get.back();
    });
  }

  static void showRentalSuccess() {
    DialogUtils.showSuccessDialog('租借成功',
        width: 250,
        height: 197,
        comBorderRadius: BorderRadius.circular(10),
        gradient: BaseColors.diaYebz,
        image: 'assets/images/custom/dia_zjcg.png',
        desc: '点击下方按键选择立马或稍后部署算力',
        barrierDismissible: false,
        confirmText: '完成', onConfirmPressed: () {
      Get.close(2);
    });
  }


  static void showShareDialog({
    bool barrierDismissible = true,
    required String title,
    String? desc,
    String? image,
    String? bgImage,
    GlobalKey? key,
    bool showBottomClose = false,
    Widget? imageWidget,
    Color? contentColor,
    Widget? child,
  }) async {
    await Future.delayed(const Duration(milliseconds: 100));
    showDialog<void>(
      context: Get.context!,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          content: RepaintBoundary(
            key: key,
            child: Column(
              children: [
                const Spacer(),
                if (image != null)
                  Image.asset(
                    image,
                    width: Get.width * 0.7,
                  ),
                Container(
                  decoration: BoxDecoration(
                      image: (bgImage != null)
                          ? DecorationImage(
                              image: AssetImage(bgImage), fit: BoxFit.cover)
                          : null),
                  width: Get.width * 0.7,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      imageWidget ?? Container(),
                      if (title.isNotEmpty)
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: fontDMBold.copyWith(
                              fontSize: 24, color: BaseColors.textColor),
                        ),
                      if (desc != null)
                        Padding(
                          padding: const EdgeInsets.only(
                              top: defaultPadding / 4,
                              bottom: defaultPadding / 2),
                          child: Text(
                            desc,
                            textAlign: TextAlign.center,
                            style: fontDMMedium.copyWith(
                                fontSize: 18, color: BaseColors.textColor),
                          ),
                        ),
                      if (child != null) child,
                    ],
                  ),
                ),
                if (showBottomClose)
                  const SizedBox(
                    height: defaultPadding,
                  ),
                if (showBottomClose)
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: SizedBox(
                      height: 60,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent,
                              border: Border.all(
                                  color: BaseColors.white, width: 1)),
                          child: const Icon(
                            Icons.close,
                            size: 35.0,
                            color: BaseColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
