import 'package:dgpt/screens/setting/google/google_sfa_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleSfaScreen extends GetView<GoogleSfaScreenController> {
  const GoogleSfaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('profile.SFA_settings'),
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tr('profile.account_activity'),
              style: fontDMMedium.copyWith(
                fontSize: 16,
                color: BaseColors.white,
              ),
            ),
            Text(
              '${tr('profile.last_login_time')}：${controller.userController.userInfo.logicEndDate ?? '无'}',
              style: fontDMMedium.copyWith(
                fontSize: 16,
                color: BaseColors.weakTextColor,
              ),
            ),
            Text(
              tr('profile.login_device'),
              style: fontDMMedium.copyWith(
                fontSize: 16,
                color: BaseColors.weakTextColor,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    tr('profile.google_authentication'),
                    style: fontDMMedium.copyWith(
                      fontSize: 16,
                      color: BaseColors.white,
                    ),
                  ),
                ),
                Obx(() => Switch(
                  value: controller.isSwitched.value,
                  onChanged: (value) {
                    Get.toNamed(AppRoutes.googleTip);
                  },
                  activeColor: BaseColors.secondPrimaryColor,
                  activeTrackColor: BaseColors.primaryColor,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: const Color(0xFF8E6CA3),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

}
