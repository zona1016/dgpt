import 'package:dgpt/screens/setting/change_password_screen_controller.dart';
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

class ChangePasswordScreen extends GetView<ChangePasswordScreenController> {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: const BaseAppBar(
        title: '更改您的密码',
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
                      '请输入您的旧密码，新密码和再次确认新的密码',
                      style: fontDMRegular.copyWith(
                          fontSize: 14,
                          color: BaseColors.white),
                    ),
                    const SizedBox(height: defaultPadding,),
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
        'assets/images/home/setting_change_psd_bg.png',
        height: 150,
        width: 175,
      ),
    );
  }

  _textFields(context) {
    return Column(
      children: [
        BaseTextFormField(
          name: "oldPsd",
          obscureText: true,
          type: TextFormFieldType.golden,
          fillColor: Colors.transparent,
          style: fontDMMedium.copyWith(
              color: BaseColors.white, fontSize: 16),
          hintText: '请输入旧的资金密码',
          radius: 10,
          onChanged: (value) {
            controller.oldPsd.value = value ?? '';
          },
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        BaseTextFormField(
          name: "newPsd",
          obscureText: true,
          type: TextFormFieldType.golden,
          fillColor: Colors.transparent,
          style: fontDMMedium.copyWith(
              color: BaseColors.white, fontSize: 16),
          hintText: '请输入新的资金密码',
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
          style: fontDMMedium.copyWith(
              color: BaseColors.white, fontSize: 16),
          hintText: '请再次输入新的资金密码',
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
      onPressed: () => controller.conform(),
      disabledDecoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30)),
      enabled: controller.oldPsd.isNotEmpty &&
          controller.newPsd.isNotEmpty &&
          controller.newPsdAgain.isNotEmpty,
      text: tr('button.confirm'),
    ));
  }
}
