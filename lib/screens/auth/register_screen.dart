import 'package:dgpt/screens/auth/register_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenArgs {
  final String? referralCode;

  RegisterScreenArgs({required this.referralCode});
}

class RegisterScreen extends GetView<RegisterScreenController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: 'assets/images/custom/register_bg.png',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: _buildHeader(),
              ),
            ),
            _buildLogin(),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 44,
          ),
          _buildHeaderDetail(),
          const SizedBox(
            height: defaultPadding,
          ),
          _buildNameAndPassword(),
          const SizedBox(
            height: defaultPadding,
          ),
          Obx(() => GestureDetector(
                onTap: () => controller.aiPulseCommonRegisterVerifyCode(),
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
          const SizedBox(
            height: defaultPadding,
          ),
        ],
      ),
    );
  }

  _buildHeaderDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(
                "assets/images/custom/register_back.png",
                width: 36,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            '邮箱注册',
            style: fontDMBold.copyWith(
              fontSize: 28,
              color: BaseColors.white,
            ),
          ),
        ),
        Text(
          '请填写相关信息以完成注册。',
          style: fontDMRegular.copyWith(
            fontSize: 14,
            color: BaseColors.white,
          ),
        ),
      ],
    );
  }

  _buildNameAndPassword() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseTextFormField(
              name: 'userName',
              hintText: 'Email@.com',
              fillColor: controller.email.isNotEmpty
                  ? BaseColors.white
                  : BaseColors.gray85.withOpacity(0.5),
              radius: 10,
              onChanged: (value) {
                controller.email.value = value ?? '';
              },
            ),
            if (controller.error.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: defaultPadding / 2),
                child: Text(controller.error.value,
                    style:
                        fontRegular.copyWith(fontSize: 12, color: Colors.red)),
              ),
            const SizedBox(
              height: defaultPadding,
            ),
            BaseTextFormField(
              name: 'password',
              hintText: '请输入您的密码',
              obscureText: true,
              style: fontDMRegular.copyWith(
                  color: BaseColors.inputTextColor.withOpacity(0.25)),
              fillColor: BaseColors.gray85.withOpacity(0.5),
              radius: 10,
              onChanged: (value) {
                controller.password.value = value ?? '';
              },
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            BaseTextFormField(
              name: 'passwordAgain',
              hintText: '再次确认您的密码',
              obscureText: true,
              style: fontDMRegular.copyWith(
                  color: BaseColors.inputTextColor.withOpacity(0.25)),
              fillColor: BaseColors.gray85.withOpacity(0.5),
              radius: 10,
              onChanged: (value) {
                controller.passwordAgain.value = value ?? '';
              },
              validator: (value) => controller.password.value != value
                  ? 'Password not match'
                  : null,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            BaseTextFormField(
              name: 'inviteCode',
              hintText: '请输入您的邀请码',
              style: fontDMRegular.copyWith(
                  color: BaseColors.inputTextColor.withOpacity(0.25)),
              fillColor: BaseColors.gray85.withOpacity(0.5),
              radius: 10,
              onChanged: (value) {
                controller.inviteCode.value = value ?? '';
              },
            ),
            const SizedBox(
              height: defaultPadding / 2,
            ),
            Text(
              '点击发送和输入邮箱验证码。',
              style: fontDMRegular.copyWith(
                fontSize: 14,
                color: BaseColors.white,
              ),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            BaseTextFormField(
              name: 'verifyCode',
              hintText: '邮箱验证码',
              fillColor: BaseColors.gray85.withOpacity(0.5),
              radius: 10,
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
                  onTap: () {
                    controller.aiPulseCommonRegisterVerifyCode();
                  },
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        '发送',
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
          ],
        ));
  }

  _buildLogin() {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            Text(
              '继续即表示同意',
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: BaseColors.lightGray,
              ),
            ),
            Text(
              '用户协议',
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: BaseColors.purpleGlowColor,
              ),
            ),
            Text(
              '/',
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: BaseColors.purpleGlowColor,
              ),
            ),
            Text(
              '隐私政策',
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: BaseColors.purpleGlowColor,
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Obx(
          () => BaseButton(
            enabled: controller.password.isNotEmpty &&
                    controller.email.isNotEmpty &&
                    controller.passwordAgain.isNotEmpty &&
                    controller.verifyCode.isNotEmpty &&
                    controller.inviteCode.isNotEmpty &&
                    controller.codeId.isNotEmpty &&
                    controller.password == controller.passwordAgain
                ? true
                : false,
            disabledDecoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/custom/register_btn_border.png'),
            )),
            onPressed: () {
              controller.register();
            },
            text: '继续',
          ),
        ),
      ],
    );
  }
}
