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
      appBar: BaseAppBar(
        title: '',
        color: Colors.transparent,
        backgroundColor: Colors.transparent,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.transparent),
        ),
      ),
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
          _buildHeaderDetail(),
          const SizedBox(
            height: defaultPadding,
          ),
          _buildNameAndPassword(),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  '已有账号?去登录',
                  style: fontSFProMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.lightGray,
                      decoration: TextDecoration.underline,
                      decorationColor: BaseColors.white),
                ),
              ),
            ],
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
                "assets/images/custom/logo.png",
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
    return Column(
      children: [
        Obx(
          () => BaseTextFormField(
            name: 'userName',
            hintText: 'Email@.com',
            fillColor: controller.userName.isNotEmpty
                ? BaseColors.white
                : BaseColors.gray85.withOpacity(0.5),
            radius: 10,
            onChanged: (value) {
              controller.userName.value = value ?? '';
            },
          ),
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
        )
      ],
    );
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
                color: Colors.purpleAccent,
              ),
            ),
            Text(
              '/',
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: Colors.purpleAccent,
              ),
            ),
            Text(
              '隐私政策',
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: Colors.purpleAccent,
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
                    controller.userName.isNotEmpty &&
                    controller.passwordAgain.isNotEmpty &&
                    controller.password == controller.passwordAgain
                ? true
                : false,
            disabledDecoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/custom/register_btn_border.png'),
                fit: BoxFit.cover
              )
            ),
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
