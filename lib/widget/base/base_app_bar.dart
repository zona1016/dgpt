import 'package:aida/utils/extensions/context_extension.dart';
import 'package:aida/utils/theme/color.dart';
import 'package:aida/utils/theme/typography.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final Color? backgroundColor;
  final Color? color;
  final double? titleSpacing;
  final Widget? flexibleSpace;
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
        this.automaticallyImplyLeading = true, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      surfaceTintColor: context.appTheme.lightPrimaryColor,
      backgroundColor: backgroundColor ?? context.appTheme.backgroundColor,
      iconTheme:
      IconThemeData(color: color ?? context.appTheme.textColor, size: 20),
      flexibleSpace: flexibleSpace,
      elevation: 0,
      titleSpacing: titleSpacing,
      actions: actions,
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
            style: fontBold.copyWith(
                fontSize: 16, color: color ?? context.appTheme.textColor),
          ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
