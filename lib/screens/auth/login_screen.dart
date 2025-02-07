import 'package:dgpt/screens/auth/login_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: 'assets/images/custom/login_bg.png',
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
            children: [_buildHeader()],
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
              GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.forgetPassword),
                child: Text(
                  tr('button.forgot_password'),
                  style: fontSFProMedium.copyWith(
                    fontSize: 14,
                    color: BaseColors.lightGray,
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.register);
                },
                child: Text(
                  tr('home.no_account_register'),
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
          "assets/images/custom/logo.png",
          width: 36,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            tr('button.login'),
            style: fontDMBold.copyWith(
              fontSize: 28,
              color: BaseColors.white,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
                child: Text(
              tr('home.enter_email_and_password_to_login'),
              style: fontDMRegular.copyWith(
                fontSize: 14,
                color: BaseColors.white,
              ),
            ))
          ],
        ),
      ],
    );
  }

  _buildNameAndPassword() {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BaseTextFormField(
              name: 'email',
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
              hintText: tr('home.enter_password'),
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
            )
          ],
        ));
  }

  _buildLogin() {
    return Column(
      children: [
        Obx(
          () => BaseButton(
            enabled:
                controller.password.isNotEmpty && controller.email.isNotEmpty
                    ? true
                    : false,
            onPressed: () {
              controller.login();
            },
            text: tr('button.login'),
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        RichText(
          text: TextSpan(
            style: fontSFProMedium.copyWith(
              fontSize: 14,
              color: BaseColors.lightGray,
            ),
            children: [
              TextSpan(
                text: tr('home.login_agree_terms'),
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                  text: tr('home.user_agreement'),
                  style: const TextStyle(color: BaseColors.purpleGlowColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle tap on 'login_agree_terms'
                      print('Login agree terms clicked');
                    }),
              const TextSpan(
                text: ' / ',
                style: TextStyle(color: BaseColors.purpleGlowColor),
              ),
              TextSpan(
                  text: tr('home.privacy_policy'),
                  style: const TextStyle(color: BaseColors.purpleGlowColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle tap on 'login_agree_terms'
                      print('Login agree terms clicked');
                    }),
            ],
          ),
        )
      ],
    );
  }
}
