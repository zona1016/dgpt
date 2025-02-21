import 'package:dgpt/screens/setting/google/google_sfa_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleTipScreen extends GetView<GoogleSfaScreenController> {
  const GoogleTipScreen({super.key});

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
            const SizedBox(height: defaultPadding,),
            Text(
              tr('profile.please_install_Google_Authenticator_on_your_phone'),
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
            Expanded(child: Container()),
            BaseButton(
              onPressed: () {
                Get.toNamed(AppRoutes.googleAuth);
              },
              text: tr('button.continue'),
            )
          ],
        ),
      ),
    );
  }

}
