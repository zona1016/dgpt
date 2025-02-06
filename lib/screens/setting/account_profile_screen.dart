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
      appBar: const BaseAppBar(
        title: '个人资料账户',
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(context)),
            SliverFillRemaining(
              hasScrollBody: false, // 如果不需要滚动内容，设置为 false
              child: _textFormFields(context), // 或者其他你想占位的内容
            ),
          ],
        ),
      ),
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
    return FormBuilder(
      key: controller.formKey,
      child: Column(
        children: [
          BaseTextFormField(
            name: "nickname",
            title: '昵称',
            type: TextFormFieldType.golden,
            fillColor: Colors.transparent,
            style: fontDMMedium.copyWith(
                color: BaseColors.white, fontSize: 16),
            hintText: 'Place enter a nickname',
            radius: 10,
            onChanged: (value) {
              controller.name.value = value ?? '';
            },
          ),
          const SizedBox(
            height: 20,
          ),
          BaseTextFormField(
            name: "email",
            title: '邮箱',
            type: TextFormFieldType.golden,
            fillColor: Colors.transparent,
            style: fontDMMedium.copyWith(
                color: BaseColors.white, fontSize: 16),
            hintText: 'Place enter a nickname',
            radius: 10,
            onChanged: (value) {
              controller.email.value = value ?? '';
            },
          ),
          const SizedBox(
            height: 20,
          ),
          _enterMobile(context),
          const SizedBox(
            height: 20 * 2,
          ),
          Obx(() => BaseButton(
            onPressed: () => controller.conform(),
            disabledDecoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30)),
            enabled: controller.name.isNotEmpty &&
                controller.email.isNotEmpty &&
                controller.phoneNum.isNotEmpty,
            text: tr('button.confirm'),
          ))
        ],
      ),
    );
  }

  _enterMobile(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('手机号',
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
                          hintText: '手机号码',
                          style: fontDMMedium.copyWith(
                              color: BaseColors.white, fontSize: 16),
                          onChanged: (value) {
                            controller.phoneNum.value = value ?? '';
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
}
