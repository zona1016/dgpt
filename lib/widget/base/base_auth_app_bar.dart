import 'package:aida/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseAuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool canBack;
  final Function()? onBackTap;
  final List<Widget>? actions;

  const BaseAuthAppBar(
      {super.key, this.canBack = true, this.onBackTap, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leadingWidth: 60,
      leading: canBack
          ? GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onBackTap ?? () => Get.back(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
          child: Image.asset(
            "assets/image/arrow_left.png",
            color: context.appTheme.textColor,
          ),
        ),
      )
          : Container(),
      elevation: 0,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
