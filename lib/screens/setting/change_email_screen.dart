import 'package:dgpt/screens/setting/change_email_screen_controller.dart';
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

class ChangeEmailScreen extends GetView<ChangeEmailScreenController> {
  const ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: const BaseAppBar(
        title: "重置邮件箱",
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
                    children: [_buildHeader(context), _textFormFields(context)],
                  ),
                ),
              ),
              _buildConfirm()
            ],
          )),
    );
  }

  _buildHeader(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: Image.asset(
        'assets/images/home/setting_email_bg.png',
        height: 150,
        width: 265,
      ),
    );
  }

  _textFormFields(context) {
    return Column(
      children: [
        BaseTextFormField(
          name: "email",
          title: tr('profile.email'),
          type: TextFormFieldType.golden,
          fillColor: Colors.transparent,
          style: fontDMMedium.copyWith(color: BaseColors.white, fontSize: 16),
          hintText: tr('error.please_enter_email'),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/home/edit_email.png',
              height: 25,
              width: 25,
            ),
          ),
          radius: 10,
          initialValue: controller.userController.userInfo.email,
          onChanged: (value) {
            controller.email.value = value ?? '';
          },
        ),
        const SizedBox(
          height: 20,
        ),
        BaseTextFormField(
          name: 'verifyCode',
          hintText: tr('home.email_verification_code'),
          fillColor: Colors.transparent,
          radius: 10,
          style: fontDMMedium.copyWith(color: BaseColors.white),
          type: TextFormFieldType.golden,
          suffixIcon: Container(
            width: 120,
            height: 32,
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
              onTap: () {},
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    tr('button.send'),
                    style: fontDMMedium.copyWith(
                      fontSize: 16,
                      color: BaseColors.black,
                    ),
                  ),
                  const SizedBox(
                    width: defaultPadding / 4,
                  ),
                  Image.asset(
                    'assets/images/custom/register_send_code.png',
                    width: 15,
                    height: 15,
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          onChanged: (value) {
            controller.verifyCode.value = value ?? '';
          },
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Obx(() => GestureDetector(
              onTap: () => controller.aiPulseCommonRegisterVerifyCode(),
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Text(
                    tr('home.did_not_receive_resend_again'),
                    style: fontDMMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: BaseColors.white,
                      // Optional: Changes the underline color
                      decorationThickness: 1.0,
                    ),
                  ),
                  if (!controller.isResendEnabled.value &&
                      controller.seconds > 0)
                    Text(
                      '${controller.seconds.value}s',
                      style: fontDMMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.purpleGlowColor,
                        decoration: TextDecoration.underline,
                        decorationColor: BaseColors.purpleGlowColor,
                        // Optional: Changes the underline color
                        decorationThickness: 1.0,
                      ),
                    ),
                ],
              ),
            )),
        const SizedBox(
          height: 20 * 2,
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
          enabled: controller.email.isNotEmpty &&
              (controller.email.value !=
                  (controller.userController.userInfo?.email ?? '')) && (
                  (controller.email.value ==
                          controller.userController.userInfo.email)
                      ? true
                      : (controller.verifyCode.isNotEmpty &&
                          controller.verifyCodeId.isNotEmpty)),
          text: tr('button.confirm'),
        ));
  }
}
