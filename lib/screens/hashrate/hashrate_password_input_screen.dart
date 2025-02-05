import 'package:dgpt/models/pulse/hashrate_page_info.dart';
import 'package:dgpt/screens/hashrate/hashrate_password_input_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HashratePasswordInputScreenArgs {
  final HasratePageInfo? hasratePageInfo;

  HashratePasswordInputScreenArgs({required this.hasratePageInfo});
}

class HashratePasswordInputScreen extends GetView<HashratePasswordInputScreenController> {
  const HashratePasswordInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            const SizedBox(height: defaultPadding,),
            Expanded(child: SingleChildScrollView(child: _buildHeader())),
            _buildActionButton(),
          ],
        ),
      ),
    );
  }

  BaseAppBar _buildAppBar() {
    return const BaseAppBar(
      title: '输入账户密码',
      color: Colors.white,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _buildActionButton() {
    return Obx(
          () => BaseButton(
        enabled: controller.password.isNotEmpty,
        disabledDecoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/custom/register_btn_border.png'),
          ),
        ),
        onPressed: () {
          controller.aiPulseUserPlanApply();
        },
        text: '确认',
      ),
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '请输入您的账户交易密码',
            style: fontDMMedium.copyWith(
              color: BaseColors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: defaultPadding),
          _buildEmailField(),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return BaseTextFormField(
      name: 'password',
      hintText: '请输入账户交易密码',
      obscureText: true,
      radius: 10,
      onChanged: (value) {
        controller.password.value = value ?? '';
      },
    );
  }
}
