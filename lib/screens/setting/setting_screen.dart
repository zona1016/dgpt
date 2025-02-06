import 'package:dgpt/screens/setting/setting_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingScreenController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: const BaseAppBar(
        title: '设定',
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: _list(
            showTop: true,
            startIndex: 0,
            itemTap: (index) {
              if (index == 0) {
                Get.toNamed(AppRoutes.accountProfile);
              } else if (index == 1) {
                Get.toNamed(AppRoutes.resetFundPsd);
              } else {
                Get.toNamed(AppRoutes.changePassword);
              }
            }
        ),
      ),
    );
  }

  _list(
      {required bool showTop,
        required int startIndex,
        required Function(int index) itemTap}) {
    return Container(
      height: 152,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: showTop
            ? BorderRadius.circular(defaultPadding).copyWith(
          topLeft: const Radius.circular(25),
          topRight: const Radius.circular(25),
        )
            : BorderRadius.circular(defaultPadding),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF23135C), // 起始颜色
            Color(0xFF321537), // 结束颜色
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _listItem(
              onTap: () => itemTap(startIndex),
              gradient: showTop
                  ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF05CCFF),
                    Color(0xFF04A2FF),
                    Color(0xFF0486FF),
                    Color(0xFF047CFF),
                  ],
                  stops: [
                    0.0,
                    0.43,
                    0.79,
                    1.0
                  ])
                  : null,
              title: controller.settingTitles[startIndex],
              image: controller.settingImages[startIndex],
              showRight: !showTop),
          if (!showTop)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
              height: 1,
              width: double.infinity,
              color: BaseColors.white.withOpacity(0.2),
            ),
          _listItem(
              onTap: () => itemTap(startIndex + 1),
              title: controller.settingTitles[startIndex + 1],
              image: controller.settingImages[startIndex + 1],
              showRight: true),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
            height: 1,
            width: double.infinity,
            color: BaseColors.white.withOpacity(0.2),
          ),
          _listItem(
              onTap: () => itemTap(startIndex + 2),
              title: controller.settingTitles[startIndex + 2],
              image: controller.settingImages[startIndex + 2],
              showRight: true),
        ],
      ),
    );
  }

  _listItem(
      {LinearGradient? gradient,
        required String image,
        required String title,
        bool showRight = false,
        GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: gradient,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: defaultPadding,
            ),
            Image.asset(
              image,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: defaultPadding / 2,
            ),
            Expanded(
              child: Text(
                title,
                style: fontDMMedium.copyWith(
                  color: BaseColors.white,
                  fontSize: 11,
                ),
              ),
            ),
            if (showRight)
              const Icon(
                Icons.chevron_right,
                size: 25,
                color: BaseColors.white,
              ),
            const SizedBox(
              width: defaultPadding,
            ),
          ],
        ),
      ),
    );
  }
}
