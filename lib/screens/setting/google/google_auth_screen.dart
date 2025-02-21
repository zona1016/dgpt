import 'package:dgpt/screens/setting/google/google_auth_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GoogleAuthScreen extends GetView<GoogleAuthScreenController> {
  const GoogleAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('profile.enable_google_verification'),
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Image.asset(
              'assets/images/home/google_tip.png',
              width: 160,
              height: 160,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Text(
              tr('profile.copy_the_key_and_add_it_to_Google_Authenticator'),
              style: fontDMMedium.copyWith(
                fontSize: 16,
                color: BaseColors.white,
              ),
            ),
            Text(
              '（Google Authenticator）',
              style: fontDMMedium.copyWith(
                fontSize: 16,
                color: BaseColors.white,
              ),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Obx(() => Container(
              height: 56,
              padding:
              const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      width: 1, color: BaseColors.white.withOpacity(0.5))),
              child: Row(
                children: [
                  Text(
                    controller.googleAuthInfo.value?.secret ?? '',
                    style: fontDMMedium.copyWith(
                      fontSize: 8,
                      color: BaseColors.weakTextColor,
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFEFEFEF), // 起始颜色
                          Color(0xFFB8CDDB), // 结束颜色
                        ],
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                            text:
                            controller.googleAuthInfo.value?.secret ?? ''));
                        ToastUtils.showToast(title: tr('tip.copy_success'));
                      },
                      child: Center(
                        child: Text(
                          tr('profile.copy_the_key'),
                          style: fontDMMedium.copyWith(
                            fontSize: 14,
                            color: BaseColors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
            Expanded(child: Container()),
            BaseButton(
              onPressed: () => Get.toNamed(AppRoutes.googleVerify),
              text: tr('button.next'),
            )
          ],
        ),
      ),
    );
  }
}
