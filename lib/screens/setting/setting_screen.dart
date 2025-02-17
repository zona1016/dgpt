import 'package:dgpt/screens/setting/setting_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingScreenController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('profile.settings'),
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF23135C), // 起始颜色
                  Color(0xFF321537), // 结束颜色
                ],
              )
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.settingTitles.length,
              itemBuilder: (_, index) {
                return _listItem(
                    onTap: () {
                      if (index == 0) {
                        Get.toNamed(AppRoutes.accountProfile);
                      } else if (index == 1) {
                        Get.toNamed(AppRoutes.changeEmail);
                      } else if (index == 2) {
                        controller.userHasTradingPwd();
                      } else if (index == 3) {
                        Get.toNamed(AppRoutes.changePassword);
                      } else if (index == 4) {
                        Get.toNamed(AppRoutes.googleSFA);
                      }
                    },
                    gradient: index == 0
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
                    title: controller.settingTitles[index],
                    image: controller.settingImages[index]);
              },
              separatorBuilder: (_, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
                  height: 1,
                  width: double.infinity,
                  color: BaseColors.white.withOpacity(0.2),
                );
              },
            )
          ),
        ],
      ),
    );
  }

  _listItem(
      {LinearGradient? gradient,
        required String image,
        required String title,
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
