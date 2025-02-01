import 'package:dgpt/screens/auth/forget_password_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordScreenController> {
  const ForgetPasswordScreen({super.key});

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

  Widget _buildActionButton() {
    return Obx(
          () => BaseButton(
        enabled: controller.email.isNotEmpty,
        disabledDecoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/custom/register_btn_border.png'),
          ),
        ),
        onPressed: () => controller.sendEmail(),
        text: '邮箱验证',
      ),
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      child: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderDetail(),
          const SizedBox(height: defaultPadding),
          _buildEmailField(),
          if (controller.error.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding / 2),
              child: Text(controller.error.value,
                  style: fontRegular.copyWith(
                      fontSize: 12, color: Colors.red)),
            ),
          const SizedBox(height: defaultPadding),
        ],
      )),
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
            '忘记密码？',
            style: fontDMBold.copyWith(fontSize: 28, color: BaseColors.white),
          ),
        ),
        Text(
          '请输入您的邮箱及验证码以完成找回。',
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
            width: 36,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return Obx(
          () => BaseTextFormField(
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
    );
  }
}
