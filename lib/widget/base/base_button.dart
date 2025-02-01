import 'package:auto_size_text/auto_size_text.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';

enum BaseButtonType { primary, secondary, custom, golden, goldenOulined }

class BaseButton extends StatelessWidget {
  final BaseButtonType type;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Gradient? gradient;
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? style;
  final BoxDecoration? customDecoration;
  final Color? textColor;
  final double? fontSize;
  final bool isDynamicWidth;
  final bool isCircleShape;
  final Widget? child;
  final bool enabled;
  final BoxDecoration? disabledDecoration;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;

  const BaseButton({
    super.key,
    this.type = BaseButtonType.primary,
    required this.onPressed,
    required this.text,
    this.borderRadius,
    this.width,
    this.height,
    this.gradient,
    this.style,
    this.textColor,
    this.child,
    this.isDynamicWidth = false,
    this.isCircleShape = false,
    this.customDecoration,
    this.enabled = true,
    this.fontSize,
    this.padding,
    this.icon,
    this.disabledDecoration,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ??
        BorderRadius.circular(type == BaseButtonType.golden || type == BaseButtonType.goldenOulined ? 5 : 30);
    return Container(
      width: isDynamicWidth ? null : width ?? double.infinity,
      height: height ?? 56,
      decoration: getButtonDecoration(context, borderRadius),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        style: ButtonStyle(
            padding: WidgetStatePropertyAll(padding ??
                EdgeInsets.symmetric(
                    horizontal: type == BaseButtonType.primary ? 12 : 6)),
            elevation: const WidgetStatePropertyAll(1),
            surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
            backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
            shadowColor: const WidgetStatePropertyAll(Colors.transparent),
            overlayColor: const WidgetStatePropertyAll(Colors.black12),
            shape: WidgetStatePropertyAll(isCircleShape
                ? const CircleBorder()
                : RoundedRectangleBorder(borderRadius: borderRadius))),
        child: child ??
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: AutoSizeText(
                      text,
                      textAlign: TextAlign.center,
                      minFontSize: 10,
                      maxLines: text.contains(' ') || text.contains('\n') ? 2 : 1,
                      stepGranularity: 0.1,
                      style: style ?? getTextStyle(context),
                    )),
                if (icon != null) icon!
              ],
            ),
      ),
    );
  }

  TextStyle getTextStyle(BuildContext context) {
    switch (type) {
      case BaseButtonType.primary:
      case BaseButtonType.secondary:
      case BaseButtonType.custom:
        return fontDMHeavy.copyWith(
            fontSize: fontSize ?? 16,
            height: 1.25,
            color: textColor ?? getTextColor());
      case BaseButtonType.golden:
      case BaseButtonType.goldenOulined:
        return fontSFProMedium.copyWith(
            fontSize: 15, color: textColor ?? getTextColor());
    }
  }

  BoxDecoration? getButtonDecoration(
      BuildContext context, BorderRadiusGeometry borderRadius) {
    switch (type) {
      case BaseButtonType.primary:
        return !enabled && disabledDecoration != null
            ? disabledDecoration
            : customDecoration ??
            BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 5.0)
              ],
              gradient: enabled ? BaseColors.baseButtonLinearGradient : null,
              color: enabled
                  ? null
                  : BaseColors.gray,
              borderRadius: borderRadius,
            );
      case BaseButtonType.secondary:
        return !enabled && disabledDecoration != null
            ? disabledDecoration
            : customDecoration ??
            BoxDecoration(
              shape: isCircleShape ? BoxShape.circle : BoxShape.rectangle,
              border: Border.all(
                  color: context.appTheme.containerColor, width: 1),
              boxShadow: [
                BoxShadow(
                    color: context.appTheme.lightPrimaryColor,
                    offset: const Offset(0, 4),
                    spreadRadius: 2,
                    blurRadius: 4)
              ],
              gradient: enabled
                  ? LinearGradient(
                colors: [
                  context.appTheme.secondaryGradientStartColor,
                  context.appTheme.secondaryGradientEndColor,
                ],
              )
                  : null,
              borderRadius: isCircleShape ? null : borderRadius,
            );
      case BaseButtonType.custom:
        return customDecoration;
      case BaseButtonType.golden:
        return !enabled && disabledDecoration != null
            ? disabledDecoration
            : customDecoration ??
            BoxDecoration(
              gradient: enabled
                  ? const LinearGradient(colors: [
                BaseColors.primaryGradientStartColor,
                BaseColors.primaryGradientEndColor
              ])
                  : null,
              borderRadius: borderRadius,
            );
      case BaseButtonType.goldenOulined:
        return !enabled && disabledDecoration != null
            ? disabledDecoration
            : customDecoration ??
            BoxDecoration(
              border: Border.all(color: BaseColors.primaryColor),
              borderRadius: borderRadius,
            );
    }
  }

  Color getTextColor() {
    switch (type) {
      case BaseButtonType.primary:
        return enabled ? Colors.white : BaseColors.lightGray;
      case BaseButtonType.secondary:
        return BaseColors.primaryColor;
      case BaseButtonType.custom:
        return textColor ?? Colors.white;
      case BaseButtonType.golden:
        return Colors.white;
      case BaseButtonType.goldenOulined:
        return BaseColors.primaryColor;
    }
  }
}
