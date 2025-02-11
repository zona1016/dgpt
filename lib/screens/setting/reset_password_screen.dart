import 'package:dgpt/screens/setting/reset_password_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends GetView<ResetPasswordScreenController> {
  const ResetPasswordScreen({super.key});

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
            tr('button.reset_password'),
            style: fontDMBold.copyWith(
              fontSize: 28,
              color: BaseColors.white,
            ),
          ),
        ),
        Text(
          tr('profile.reset_login_password_tip'),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultPadding,
        ),
        BaseTextFormField(
          name: 'password',
          hintText: tr('profile.enter_new_password'),
          obscureText: true,
          style: fontDMRegular.copyWith(
              color: BaseColors.inputTextColor.withOpacity(0.25)),
          fillColor: BaseColors.gray85.withOpacity(0.5),
          radius: 10,
          onChanged: (value) {
            controller.newPsd.value = value ?? '';
          },
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        BaseTextFormField(
          name: 'passwordAgain',
          hintText: tr('profile.reenter_new_password'),
          obscureText: true,
          style: fontDMRegular.copyWith(
              color: BaseColors.inputTextColor.withOpacity(0.25)),
          fillColor: BaseColors.gray85.withOpacity(0.5),
          radius: 10,
          onChanged: (value) {
            controller.newPsdAgain.value = value ?? '';
          },
          validator: (value) => controller.newPsd.value != value
              ? 'Password not match'
              : null,
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }

  _buildLogin() {
    return Obx(
          () => BaseButton(
        enabled: controller.newPsd.isNotEmpty &&
            controller.newPsdAgain.isNotEmpty &&
            controller.newPsd == controller.newPsdAgain
            ? true
            : false,
        disabledDecoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/custom/register_btn_border.png'),
            )),
        onPressed: () {
          controller.userResetPwdSubmit();
        },
        text: tr('button.continue'),
      ),
    );
  }
}
