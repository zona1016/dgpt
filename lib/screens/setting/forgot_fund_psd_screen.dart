import 'package:dgpt/screens/setting/forgot_fund_psd_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotFundPsdScreen extends GetView<ForgotFundPsdScreenController> {
  const ForgotFundPsdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('profile.forgot_transaction_password'),
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            _buildHeader(context),
            Text(
              tr('profile.click_continue_receive_email'),
              style: fontDMRegular.copyWith(
                  fontSize: 14,
                  color: BaseColors.white),
            ),
            Expanded(child: Container()),
            _buildConfirm()
          ],
        ),
      ),
    );
  }

  _buildHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Image.asset(
        'assets/images/home/setting_wjzjmm_bg.png',
        height: 135,
        width: 165,
      ),
    );
  }

  _buildConfirm() {
    return BaseButton(
      onPressed: () => Get.toNamed(AppRoutes.emailVerification),
      disabledDecoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30)),
      text: tr('button.continue'),
    );
  }
}
