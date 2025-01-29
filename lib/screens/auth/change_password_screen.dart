import 'package:dgpt/screens/auth/change_password_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends GetView<ChangePasswordScreenController> {
  const ChangePasswordScreen({super.key});

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
            height: defaultPadding / 2,
          ),
          _buildChange(),
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
              onTap: () => Get.back(),
              child: Image.asset(
                "assets/images/tab/home_inactive.png",
                width: 40,
              ),
            ),
            const SizedBox(width: defaultPadding,),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            '重置密码',
            style: fontDMBold.copyWith(
              fontSize: 28,
              color: BaseColors.white,
            ),
          ),
        ),
        Text(
          '为了您的资金及信息安全，请重置登录密码',
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
        BaseTextFormField(
          name: 'passwordOld',
          hintText: '请输入您的旧密码',
          radius: 10,
          onChanged: (value) {
            controller.passwordOld.value = value ?? '';
          },
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        BaseTextFormField(
          name: 'passwordNew',
          hintText: '请输入您的新密码',
          obscureText: true,
          radius: 10,
          onChanged: (value) {
            controller.passwordNew.value = value ?? '';
          },
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        BaseTextFormField(
          name: 'passwordNewAgain',
          hintText: '请输入您的新密码',
          obscureText: true,
          radius: 10,
          onChanged: (value) {
            controller.passwordNewAgain.value = value ?? '';
          },
          validator: (value) => controller.passwordNew.value != value
              ? 'Password not match'
              : null,
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }

  _buildChange() {
    return Column(
      children: [
        Obx(
          () => BaseButton(
            enabled: controller.passwordNew.isNotEmpty &&
                    controller.passwordOld.isNotEmpty &&
                    controller.passwordNewAgain.isNotEmpty &&
                    controller.passwordOld == controller.passwordNewAgain
                ? true
                : false,
            onPressed: () {
              controller.login();
            },
            text: '确认',
          ),
        ),
      ],
    );
  }
}
