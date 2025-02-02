import 'package:dgpt/utils/api/api_exception.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
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
      required String title,
      String? desc,
      String? image,
      String? topTitle,
      String? bottomTitle,
      bool showBottomClose = false,
      Widget? imageWidget,
      Color? contentColor,
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
                    color: contentColor ?? context.appTheme.lightPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                width: Get.width * 0.6,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    imageWidget ?? Container(),
                    if (title.isNotEmpty)
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: fontSFProBold.copyWith(
                            fontSize: 17, color: context.appTheme.textColor),
                      ),
                    if (desc != null)
                      Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: fontSFProRegular.copyWith(
                            fontSize: 12,
                            color: context.appTheme.weakTextColor),
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
                                  type: BaseButtonType.primary,
                                  height: 35,
                                  onPressed: () {
                                    onConfirmPressed?.call();
                                  },
                                  text: confirmText,
                                )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              if (image != null)
                Positioned(
                    top: -25,
                    left: 0,
                    right: 0,
                    child: Image.asset(
                      image,
                      width: double.infinity,
                      height: 50,
                    )),
              if (topTitle != null)
                Positioned(
                    top: (image == null) ? -25 : -50,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        topTitle,
                        style: fontSFProMedium.copyWith(
                            color: BaseColors.white, fontSize: 14),
                      ),
                    )),
              if (bottomTitle != null)
                Positioned(
                    bottom: -60,
                    left: defaultPadding,
                    right: defaultPadding,
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: BaseColors.primaryColor),
                      child: Center(
                        child: Text(
                          bottomTitle,
                          style: fontSFProMedium.copyWith(
                              color: Colors.white, fontSize: 14),
                        ),
                      ),
                    )),
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
                            color: BaseColors.white,
                            width: 1
                          )
                        ),
                        child: const Icon(
                          Icons.close,
                          size: 40.0,
                          color: BaseColors.white,
                        ),
                      ),
                    ),
                  )
                )
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
      {String? desc,
      bool barrierDismissible = true,
      String? confirmText,
      String? underlinedText,
      Function()? onConfirmPressed,
      Function()? onUnderLinedTextClicked}) {
    showBaseDialog(
      desc: desc,
      title: title,
      barrierDismissible: barrierDismissible,
      image: "success",
      underlinedText: underlinedText,
      confirmText: confirmText ?? tr("button.confirm"),
      onUnderLinedTextClicked: onUnderLinedTextClicked,
      onConfirmPressed: onConfirmPressed ??
          () {
            Get.back();
          },
    );
  }

  static void showErrorDialog(title,
      {bool barrierDismissible = true,
      String? confirmText,
      Function()? onConfirmPressed}) {
    showBaseDialog(
      title: title,
      barrierDismissible: barrierDismissible,
      image: "fail",
      confirmText: confirmText ?? tr("button.confirm"),
      onConfirmPressed: onConfirmPressed ??
          () {
            Get.back();
          },
    );
  }

  static void showRetryDialog(title,
      {bool barrierDismissible = true,
      String? retryText,
      Function()? onRetryPressed}) {
    showBaseDialog(
      title: title,
      barrierDismissible: barrierDismissible,
      image: "fail",
      cancelText: retryText ?? tr("button.cancel"),
      onCancelPressed: onRetryPressed ??
          () {
            Get.back();
          },
    );
  }

  static void showCompleteProfileDialog(title,
      {bool barrierDismissible = true,
      String? cancelText,
      Function()? onConfirmPressed}) {
    showBaseDialog(
      title: title,
      barrierDismissible: barrierDismissible,
      image: "fail",
      cancelText: cancelText ?? tr("button.get_started"),
      onCancelPressed: onConfirmPressed ??
          () {
            Get.back();
          },
    );
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
      if (Get.currentRoute.contains("gw")) {
        showGWErrorDialog(msg);
      } else {
        showErrorDialog(msg);
      }
    }
  }

  static void showGWSuccessDialog(String title,
      {String? desc,
      bool barrierDismissible = true,
      String? confirmText,
      Function()? onConfirmPressed}) {
    showDGPTBaseDialog(
      desc: desc,
      title: title,
      barrierDismissible: barrierDismissible,
      image: "gw_success",
      confirmText: confirmText ?? tr("button.confirm"),
      onConfirmPressed: onConfirmPressed ??
          () {
            Get.back();
          },
    );
  }

  static void showGWErrorDialog(String title,
      {String? desc, String? confirmText, Function()? onConfirmPressed}) {
    showDGPTBaseDialog(
      desc: desc,
      title: title,
      image: "gw_fail",
      confirmText: confirmText ?? tr("button.confirm"),
      onConfirmPressed: onConfirmPressed ??
          () {
            Get.back();
          },
    );
  }

  static void showLoginSuccess(
      {required String image,
      required String stateTitle,
      required String detail,
      bool showError = false}) {
    showDGPTBaseDialog(
        barrierDismissible: false,
        title: '',
        contentColor: Colors.purple,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
                color: showError ? Colors.red : BaseColors.primaryColor,
              ),
              const SizedBox(
                height: defaultPadding / 2,
              ),
              Text(
                stateTitle,
                style: fontDMHeavy.copyWith(
                    color: BaseColors.primaryColor, fontSize: 20),
              ),
              const SizedBox(
                height: defaultPadding / 2,
              ),
              Text(
                detail,
                style: fontDMMedium.copyWith(
                    color: showError ? Colors.red : BaseColors.whiteGray1,
                    fontSize: 14),
              ),
              const SizedBox(
                height: defaultPadding / 2,
              ),
              const CircularProgressIndicator(
                color: BaseColors.primaryColor, // 颜色
                strokeWidth: 4.0, // 圆圈线条宽度
              )
            ],
          ),
        ));
  }

  static void showShareDialog(
      {bool barrierDismissible = true,
        required String title,
        String? desc,
        String? image,
        String? bgImage,
        GlobalKey? key,
        bool showBottomClose = false,
        Widget? imageWidget,
        Color? contentColor,
        Widget? child,}) async {
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
                    image: (bgImage != null) ? DecorationImage(
                      image: AssetImage(bgImage),
                      fit: BoxFit.cover
                    )  : null
                  ),
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
                          padding: const EdgeInsets.only(top: defaultPadding / 4, bottom: defaultPadding / 2),
                          child: Text(
                            desc,
                            textAlign: TextAlign.center,
                            style: fontDMMedium.copyWith(
                                fontSize: 18,
                                color: BaseColors.textColor),
                          ),
                        ),
                      if (child != null) child,
                    ],
                  ),
                ),
                if (showBottomClose)
                  const SizedBox(height: defaultPadding,),
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
                                  color: BaseColors.white,
                                  width: 1
                              )
                          ),
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
