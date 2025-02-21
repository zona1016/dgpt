import 'package:dgpt/screens/setting/reset_fund_psd_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetFundPsdScreen extends GetView<ResetFundPsdScreenController> {
  const ResetFundPsdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('profile.reset_transaction_password'),
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(context),
                    Text(
                      tr('tip.reset_fund_tip'),
                      style: fontDMRegular.copyWith(
                          fontSize: 14, color: BaseColors.white),
                    ),
                    _textFields(context)
                  ],
                ),
              ),
            ),
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
        'assets/images/home/setting_reset_fund_psd_bg.png',
        height: 150,
        width: 205,
      ),
    );
  }

  _textFields(context) {
    return Column(
      children: [
        BaseTextFormField(
          name: "newPsd",
          obscureText: true,
          type: TextFormFieldType.golden,
          fillColor: Colors.transparent,
          style: fontDMMedium.copyWith(color: BaseColors.white, fontSize: 16),
          hintText: tr('profile.enter_new_transaction_password'),
          radius: 10,
          onChanged: (value) {
            controller.newPsd.value = value ?? '';
          },
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        BaseTextFormField(
          name: "newPsdAgain",
          obscureText: true,
          type: TextFormFieldType.golden,
          fillColor: Colors.transparent,
          style: fontDMMedium.copyWith(color: BaseColors.white, fontSize: 16),
          hintText: tr('profile.reenter_new_transaction_password'),
          radius: 10,
          onChanged: (value) {
            controller.newPsdAgain.value = value ?? '';
          },
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }

  _buildConfirm() {
    return Obx(() => BaseButton(
          onPressed: () => controller.userResetTradingPwdSubmit(),
          disabledDecoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30)),
          enabled: controller.newPsd.isNotEmpty &&
              controller.newPsdAgain.isNotEmpty &&
              (controller.newPsd == controller.newPsdAgain),
          text: tr('button.confirm'),
        ));
  }
}
