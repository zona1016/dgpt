import 'package:aida/utils/extensions/context_extension.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

enum BaseButtonType { primary, secondary, custom }

class BaseButton extends StatelessWidget {
  final BaseButtonType type;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
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
    this.height = 50.0,
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: isDynamicWidth ? null : width ?? double.infinity,
        height: height,
        child: child ??
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: AutoSizeText(
                      text,
                      textAlign: TextAlign.center,
                      minFontSize: 10,
                      maxLines: text.contains(' ') || text.contains('\n') ? 2 : 1,
                      stepGranularity: 0.1,
                      style: style ??
                          fontBold.copyWith(
                              fontSize: fontSize ?? 16,
                              height: 1.25,
                              color: textColor ?? getTextColor()),
                    )),
                if (icon != null) icon!
              ],
            ),
      ),
    );
  }

  BoxDecoration? getButtonDecoration(
      BuildContext context, BorderRadiusGeometry borderRadius) {
    switch (type) {
      case BaseButtonType.primary:
        return BoxDecoration(
          borderRadius: borderRadius,
          image: const DecorationImage(
            image: AssetImage('assets/image/base/button_bg.png'),
            fit: BoxFit.fill,
          ),
        );
      case BaseButtonType.secondary:
        return !enabled && disabledDecoration != null
            ? disabledDecoration
            : customDecoration ?? BoxDecoration(
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
    }
  }

  Color getTextColor() {
    switch (type) {
      case BaseButtonType.primary:
        return enabled ? BaseColors.secondPrimaryColor : BaseColors.secondPrimaryColor;
      case BaseButtonType.secondary:
        return BaseColors.primaryColor;
      case BaseButtonType.custom:
        return textColor ?? Colors.white;
    }
  }
}
