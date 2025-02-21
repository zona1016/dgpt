import 'package:dgpt/screens/setting/email_code_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/string_extension.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailCodeScreenArgs {
  final String email;
  final String codeId;

  EmailCodeScreenArgs({required this.email, required this.codeId});
}

class EmailCodeScreen extends GetView<EmailCodeScreenController> {
  const EmailCodeScreen({super.key});

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
            Expanded(child: SingleChildScrollView(child: _buildHeader(context))),
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
        onPressed: () => Get.toNamed(AppRoutes.resetPassword),
        text: tr('button.confirm'),
      ),
    );
  }

  Widget _buildHeader(context) {
    return SafeArea(
      child: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderDetail(),
          const SizedBox(height: defaultPadding),
          _buildPinCodeTextField(context),
          const SizedBox(height: defaultPadding / 2),
          GestureDetector(
            onTap: () => controller.sendEmail(),
            child: Row(
              children: [
                Expanded(child: Container()),
                Text(
                  tr('home.did_not_receive_resend'),
                  style: fontDMMedium.copyWith(
                    fontSize: 14,
                    color: BaseColors.white,
                    decoration: TextDecoration.underline,
                    decorationColor: BaseColors.white,        // Optional: Changes the underline color
                    decorationThickness: 1.0,
                  ),
                ),
                if (!controller.isResendEnabled.value)
                  Text(
                    '${controller.seconds.value}s',
                    style: fontDMMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.purpleGlowColor,
                      decoration: TextDecoration.underline,
                      decorationColor: BaseColors.purpleGlowColor,        // Optional: Changes the underline color
                      decorationThickness: 1.0,
                    ),
                  ),
              ],
            ),
          ),
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
            tr('home.verify_email'),
            style: fontDMBold.copyWith(fontSize: 28, color: BaseColors.white),
          ),
        ),
        Text(
          tr('home.verification_email_sent_message', args: [controller.args!.email.toString().maskEmail()]),
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

  Widget _buildPinCodeTextField(context) {
    return PinCodeTextField(
      focusNode: controller.focusNode,
      appContext: context,
      length: 6,
      obscureText: false,
      animationType: AnimationType.fade,
      textStyle: fontDMMedium.copyWith(
        fontSize: 24,
        color: BaseColors.white
      ),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 56,
        fieldWidth: (SizeUtil.width() - defaultPadding * 5) / 6,
        activeColor: BaseColors.gray85.withOpacity(0.2),
        inactiveColor: BaseColors.gray85.withOpacity(0.2),
        selectedColor: BaseColors.purpleGlowColor.withOpacity(0.6),
        activeFillColor: BaseColors.gray85.withOpacity(0.2),
        inactiveFillColor: BaseColors.gray85.withOpacity(0.2),
        selectedFillColor: BaseColors.purpleGlowColor.withOpacity(0.6),
      ),
      cursorColor: Colors.red,
      enableActiveFill: true,
      controller: controller.textEditingController,
      keyboardType: TextInputType.number,
      onChanged: (value) {

      },
      onCompleted: (value) {
        controller.emailCode = value;
      },
    );
  }
}
