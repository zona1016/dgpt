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
      backgroundColor: Colors.transparent,
      backgroundImage: 'assets/images/custom/forget_password_bg.png',
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            Expanded(child: SingleChildScrollView(child: _buildHeader())),
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  BaseAppBar _buildAppBar() {
    return BaseAppBar(
      title: '',
      color: Colors.transparent,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(color: Colors.transparent),
      ),
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderDetail(),
          const SizedBox(height: defaultPadding),
          _buildPasswordFields(),
          const SizedBox(height: defaultPadding / 2),
        ],
      ),
    );
  }

  Widget _buildHeaderDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBackButton(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            '重置密码',
            style: fontDMBold.copyWith(fontSize: 28, color: BaseColors.white),
          ),
        ),
        Text(
          '为了您的资金及信息安全，请重置登录密码',
          style: fontDMRegular.copyWith(fontSize: 14, color: BaseColors.white),
        ),
      ],
    );
  }

  Widget _buildBackButton() {
    return Row(
      children: [
        Expanded(child: Container()),
        GestureDetector(
          onTap: () => Get.back(),
          child: Image.asset(
            "assets/images/custom/register_back.png",
            width: 40,
          ),
        ),
        const SizedBox(width: defaultPadding),
      ],
    );
  }

  Widget _buildPasswordFields() {
    return Column(
      children: [
        _buildPasswordField(
          name: 'passwordOld',
          hintText: '请输入您的旧密码',
          obscureText: true,
          onChanged: (value) => controller.passwordOld.value = value ?? '',
        ),
        const SizedBox(height: defaultPadding),
        _buildPasswordField(
          name: 'passwordNew',
          hintText: '请输入您的新密码',
          obscureText: true,
          onChanged: (value) => controller.passwordNew.value = value ?? '',
        ),
        const SizedBox(height: defaultPadding),
        _buildPasswordField(
          name: 'passwordNewAgain',
          hintText: '请输入您的新密码',
          obscureText: true,
          onChanged: (value) => controller.passwordNewAgain.value = value ?? '',
          validator: (value) =>
          controller.passwordNew.value != value ? 'Password not match' : null,
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }

  Widget _buildPasswordField({
    required String name,
    required String hintText,
    bool obscureText = false,
    Function(String?)?  onChanged,
    String? Function(String?)? validator,
  }) {
    return BaseTextFormField(
      name: name,
      hintText: hintText,
      obscureText: obscureText,
      radius: 10,
      onChanged: onChanged,
      validator: validator,
    );
  }

  Widget _buildActionButton() {
    return Obx(
          () => BaseButton(
        enabled: _isPasswordFieldsValid(),
        disabledDecoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/custom/register_btn_border.png'),
          ),
        ),
        onPressed: () {},
        text: '确认',
      ),
    );
  }

  bool _isPasswordFieldsValid() {
    return controller.passwordNew.isNotEmpty &&
        controller.passwordNewAgain.isNotEmpty &&
        controller.passwordNew.value == controller.passwordNewAgain.value;
  }
}
