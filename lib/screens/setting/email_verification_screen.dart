import 'package:dgpt/screens/setting/email_verification_screen_controller.dart';
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
import 'package:dgpt/utils/extensions/string_extension.dart';

enum EmailVerificationType {register, password, fundPassword, changeEmail}

class EmailVerificationScreenArgs {
  final String email;
  final EmailVerificationType type;

  EmailVerificationScreenArgs({required this.email, required this.type});
}

class EmailVerificationScreen extends GetView<EmailVerificationScreenController> {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('profile.email_verification'),
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            _buildHeader(context),
            Text(
              tr('home.verification_email_sent_message', args: [controller.args!.email.toString().maskEmail()]),
              style: fontDMRegular.copyWith(
                  fontSize: 14,
                  color: BaseColors.white),
            ),
            const SizedBox(height: defaultPadding,),
            BaseTextFormField(
              name: "code",
              type: TextFormFieldType.golden,
              fillColor: Colors.transparent,
              style: fontDMMedium.copyWith(
                  color: BaseColors.white, fontSize: 16),
              hintText: '输入验证码',
              radius: 10,
              onChanged: (value) {
                controller.code.value = value ?? '';
              },
            ),
            const SizedBox(height: defaultPadding,),
            Obx(() => GestureDetector(
              onTap: () => controller.verifyCode(),
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Text(
                    '未收到？重新发送 ',
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
        'assets/images/home/setting_yxyz_bg.png',
        height: 150,
        width: 175,
      ),
    );
  }

  _buildConfirm() {
    return Obx(() => BaseButton(
      onPressed: () => controller.conform(),
      disabledDecoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30)),
      enabled: controller.code.isNotEmpty,
      text: tr('button.continue'),
    ));
  }
}
