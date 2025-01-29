import 'package:dgpt/screens/auth/login_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.deepPurple,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader()
            ],
          ),
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
              // GestureDetector(
              //   onTap: () => Get.toNamed(AppRoutes.changePassword),
              //   child: Text(
              //     '忘记密码?',
              //     style: fontSFProMedium.copyWith(
              //       fontSize: 14,
              //       color: BaseColors.lightGray,
              //     ),
              //   ),
              // ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.register);
                },
                child: Text(
                  '没有账号?去注册',
                  style: fontSFProMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.lightGray,
                      decoration: TextDecoration.underline,
                      decorationColor: BaseColors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          _buildLogin(),
        ],
      ),
    );
  }

  _buildHeaderDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/tab/home_inactive.png",
          width: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            '登录',
            style: fontDMBold.copyWith(
              fontSize: 28,
              color: BaseColors.white,
            ),
          ),
        ),
        Text(
          '请输入您的账号和密码以完成登录。',
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
            hintText: 'Account',
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
        Obx(
          () => BaseTextFormField(
            name: 'password',
            hintText: 'Password',
            obscureText: true,
            style: fontDMRegular.copyWith(
                color: controller.password.isNotEmpty
                    ? BaseColors.white
                    : BaseColors.weakTextColor),
            fillColor: controller.password.isNotEmpty
                ? BaseColors.primaryColor
                : BaseColors.gray85.withOpacity(0.5),
            radius: 10,
            onChanged: (value) {
              controller.password.value = value ?? '';
            },
          ),
        )
      ],
    );
  }

  _buildLogin() {
    return Column(
      children: [
        Obx(
          () => BaseButton(
            enabled:
                controller.password.isNotEmpty && controller.userName.isNotEmpty
                    ? true
                    : false,
            onPressed: () {
              controller.login();
            },
            text: '登录',
          ),
        ),
        const SizedBox(height: defaultPadding,),
        Row(
          children: [
            const Spacer(),
            Text(
              '登录即表示同意',
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
        )
      ],
    );
  }

  _buildBottom() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                height: 1,
                width: double.infinity,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
              child: Text(
                '其他登录方式',
                style: fontSFProMedium.copyWith(
                  fontSize: 14,
                  color: BaseColors.lightGray,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: BaseColors.white,
                height: 1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        Row(
          children: [
            Expanded(
                child: GestureDetector(
              onTap: () => controller.signInWithGoogle(),
              child: _otherLogin(),
            )),
            const SizedBox(
              width: defaultPadding,
            ),
            Expanded(
                child: GestureDetector(
              onTap: () => controller.signInWithFacebook(),
              child: _otherLogin(),
            )),
            const SizedBox(
              width: defaultPadding,
            ),
            Expanded(child: Container()),
            const SizedBox(
              width: defaultPadding,
            ),
            Expanded(child: Container()),
          ],
        )
      ],
    );
  }

  _otherLogin() {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: BaseColors.weakTextColor),
      child: Center(
        child: Image.asset(
          "assets/images/tab/home_inactive.png",
          width: 20,
        ),
      ),
    );
  }
}
