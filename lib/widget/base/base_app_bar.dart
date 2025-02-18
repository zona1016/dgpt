import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Color? backgroundColor;
  final Color? color;
  final double? titleSpacing;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final Widget? leading;
  final Function()? onBackTap;
  final bool automaticallyImplyLeading;

  const BaseAppBar(
      {super.key,
        this.title,
        this.flexibleSpace,
        this.backgroundColor,
        this.color,
        this.titleSpacing,
        this.actions,
        this.titleWidget,
        this.onBackTap,
        this.bottom,
        this.automaticallyImplyLeading = true, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      surfaceTintColor: context.appTheme.lightPrimaryColor,
      backgroundColor: backgroundColor ?? Colors.white.withOpacity(0.1),
      iconTheme:
      IconThemeData(color: color ?? context.appTheme.textColor, size: 20),
      flexibleSpace: flexibleSpace ?? FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF5009C2),
                Color(0xFF4A045C),
              ],
              stops: [0.0, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),// 圆角
          ),
        ),
      ),
      elevation: 0,
      titleSpacing: titleSpacing,
      actions: actions,
      bottom: bottom,
      leading: leading ?? (onBackTap != null ? BackButton(onPressed: onBackTap, style: const ButtonStyle(
          fixedSize:
          WidgetStatePropertyAll(Size(45, 45)),
          backgroundColor: WidgetStatePropertyAll(
              BaseColors.black15),
          padding: WidgetStatePropertyAll(
              EdgeInsets.all(12))),) : null),
      title: titleWidget ??
          Text(
            title ?? '',
            style: fontMedium.copyWith(
                fontSize: 18, color: color ?? context.appTheme.textColor),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
