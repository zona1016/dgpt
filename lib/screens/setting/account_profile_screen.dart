import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/screens/setting/account_profile_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:dgpt/widget/form/borderless_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class AccountProfileScreen extends GetView<AccountProfileScreenController> {
  const AccountProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: tr('profile.profile_account'),
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [_buildHeader(context), _textFormFields(context)],
                  ),
                ),
              ),
              _buildConfirm()
            ],
          )),
    );
  }

  _buildHeader(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultPadding,
        ),
        Center(
          child: Stack(
            children: [
              Container(
                height: 140,
                width: 140,
                padding: const EdgeInsets.all(defaultPadding),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage('assets/images/custom/profile_icon_bg.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: ClipOval(
                    // 裁剪成圆形
                    child: BaseNetworkImage(
                      imageURL: '',
                      placeholder:
                          "assets/images/placeholder/profile_placeholder.png",
                      fit: BoxFit.cover,
                      height: 120,
                      width: 120,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: defaultPadding,
                right: defaultPadding,
                child: InkWell(
                  onTap: () async {
                    await controller.onPickCoverImage(context: context);
                  },
                  child: Image.asset(
                    'assets/images/home/setting_edit.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
      ],
    );
  }

  _textFormFields(context) {
    return Column(
      children: [
        BaseTextFormField(
          name: "nickname",
          title: tr('profile.nickname'),
          type: TextFormFieldType.golden,
          fillColor: Colors.transparent,
          style: fontDMMedium.copyWith(color: BaseColors.white, fontSize: 16),
          hintText: tr('profile.place_enter_a_nickname'),
          radius: 10,
          onChanged: (value) {
            controller.nickName.value = value ?? '';
          },
        ),
        const SizedBox(
          height: 20,
        ),
        BaseTextFormField(
          name: "email",
          title: tr('profile.email'),
          type: TextFormFieldType.golden,
          fillColor: Colors.transparent,
          style: fontDMMedium.copyWith(color: BaseColors.white, fontSize: 16),
          hintText: tr('error.please_enter_email'),
          suffixIcon: GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/home/edit_email.png',
              height: 25,
              width: 25,
            ),
          ),
          radius: 10,
          initialValue: controller.userController.userInfo.email,
          onChanged: (value) {
            controller.email.value = value ?? '';
          },
        ),
        const SizedBox(
          height: 20,
        ),
        _enterMobile(context),
        const SizedBox(
          height: defaultPadding,
        ),
        BaseTextFormField(
          name: 'verifyCode',
          hintText: tr('home.email_verification_code'),
          fillColor: Colors.transparent,
          radius: 10,
          style: fontDMMedium.copyWith(
            color: BaseColors.white
          ),
          type: TextFormFieldType.golden,
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
              onTap: () {},
              child: Row(
                children: [
                  const Spacer(),
                  Text(
                    tr('button.send'),
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
        const SizedBox(
          height: defaultPadding,
        ),
        Obx(() => GestureDetector(
              onTap: () => controller.aiPulseCommonRegisterVerifyCode(),
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Text(
                    tr('home.did_not_receive_resend_again'),
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
          height: 20 * 2,
        ),
      ],
    );
  }

  _enterMobile(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tr('profile.mobile_number'),
                  style:
                      fontMedium.copyWith(fontSize: 14, color: Colors.white)),
              const SizedBox(height: 5),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: BaseColors.white, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent),
                child: Row(
                  children: [
                    Row(
                      children: [
                        CountryCodePicker(
                          dialogBackgroundColor: BaseColors.lightGray,
                          onChanged: (code) {
                            controller.code.value = code;
                          },
                          textStyle: fontDMMedium.copyWith(
                              color: BaseColors.white, fontSize: 16),
                          showFlag: false,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'MY',
                          favorite: const ['+ 60'],
                          showFlagDialog: true,
                          padding: const EdgeInsets.all(0),
                        ),
                        Image.asset(
                          'assets/images/home/setting_right_icon.png',
                          height: 10,
                          width: 10,
                        ),
                        const SizedBox(
                          width: defaultPadding / 2,
                        ),
                        Container(
                          width: 1,
                          height: 56,
                          color: BaseColors.white,
                        )
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FormBuilder(
                        child: BorderlessTextFormField(
                          name: "phone",
                          keyboardType: TextInputType.number,
                          hintText: tr('profile.mobile_number'),
                          style: fontDMMedium.copyWith(
                              color: BaseColors.white, fontSize: 16),
                          initialValue:
                              controller.userController.userInfo.phone,
                          onChanged: (value) {
                            controller.phoneNumber.value = value ?? '';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildConfirm() {
    return Obx(() => BaseButton(
          onPressed: () => controller.conform(),
          disabledDecoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30)),
          enabled: (controller.nickName.isNotEmpty &&
                  controller.email.isNotEmpty &&
                  controller.phoneNumber.isNotEmpty &&
                  controller.phoneNation.isNotEmpty) &&
              ((controller.email.value ==
                      controller.userController.userInfo.email)
                  ? true
                  : (controller.verifyCode.isNotEmpty &&
                      controller.verifyCodeId.isNotEmpty)),
          text: tr('button.confirm'),
        ));
  }
}
