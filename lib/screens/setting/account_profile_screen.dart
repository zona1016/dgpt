import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/screens/setting/account_profile_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:dgpt/widget/form/borderless_text_field.dart';
import 'package:dgpt/widget/form/custom_form_builder_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class AccountProfileScreen extends GetView<AccountProfileScreenController> {
  const AccountProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: '',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: _buildHeader()
            ),
            SliverFillRemaining(
              hasScrollBody: false, // 如果不需要滚动内容，设置为 false
              child: _textFormFields(context), // 或者其他你想占位的内容
            ),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Profile',
          style: fontSFProMedium.copyWith(
            fontSize: 30,
            color: BaseColors.white,
          ),
        ),
        const SizedBox(height: defaultPadding,),
        Center(
          child: Stack(
            children: [
              SizedBox(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: const AspectRatio(
                    aspectRatio: 1,
                    child: BaseNetworkImage(
                      imageURL: '',
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(defaultPadding / 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: BaseColors.primaryColor
                  ),
                  child: Icon(Icons.edit, color: Colors.black, size: 20,),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: defaultPadding,),
      ],
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
              onTap: () {},
              child: Image.asset(
                "assets/images/tab/home_inactive.png",
                width: 20,
              ),
            ),
            const SizedBox(
              width: defaultPadding,
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                "assets/images/tab/home_inactive.png",
                width: 20,
              ),
            ),
          ],
        ),
        Image.asset(
          "assets/images/tab/home_inactive.png",
          width: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            'Login',
            style: fontSFProMedium.copyWith(
              fontSize: 28,
              color: BaseColors.white,
            ),
          ),
        ),
        Text(
          'Please enter your email and password to complete',
          style: fontSFProMedium.copyWith(
            fontSize: 14,
            color: BaseColors.lightGray,
          ),
        ),
      ],
    );
  }

  _textFormFields(context) {
    return Column(
      children: [
        BaseTextFormField(
          name: "nickname",
          title: 'Nickname',
          type: TextFormFieldType.golden,
          isRequired: true,
          hintText: 'Place enter a nickname',
          radius: 10,
          validator: FormBuilderValidators.compose([
            CustomFormBuilderValidators.required('Place enter a nickname')
          ]),
        ),
        const SizedBox(height: 20,),
        BaseTextFormField(
          name: "email",
          title: 'Email',
          enabled: false,
          type: TextFormFieldType.golden,
          isRequired: true,
          hintText: 'Place enter a nickname',
          radius: 10,
          validator: FormBuilderValidators.compose([
            CustomFormBuilderValidators.required('Place enter a nickname')
          ]),
        ),
        const SizedBox(height: 20,),
        _enterMobile(context),
        const SizedBox(height: 20 * 2,),
        BaseButton(
          onPressed: (){},
          text: 'Conform',
        )
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
              Text('Mobile phone number',
                  style: fontMedium.copyWith(
                      fontSize: 14, color: Colors.white)),
              const SizedBox(height: 5),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: context.appTheme.secondaryContainerColor),
                child: Row(
                  children: [
                    Row(
                      children: [
                        CountryCodePicker(
                          dialogBackgroundColor:
                          context.appTheme.backgroundColor,
                          onChanged: (code) {

                          },
                          showFlag: false,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'MY',
                          favorite: const ['+60'],
                          showFlagDialog: true,
                          padding: const EdgeInsets.all(0),
                        ),
                        Icon(Icons.arrow_right_sharp, size: 24,),
                        SizedBox(width: defaultPadding / 2,),
                        Container(width: 1, height: 44, color: Colors.red,)
                      ],
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: FormBuilder(
                        key: controller.formKey,
                        child: BorderlessTextFormField(
                          name: "phone",
                          keyboardType: TextInputType.number,
                          hintText: 'placeholder.input_field',
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

  _buildLogin() {
    return Obx(() =>
        Column(
          children: [
            GestureDetector(
              onTap: () {
                if (!controller.canLogin.value) return;
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: defaultPadding),
                height: 44,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: controller.canLogin.value
                        ? BaseColors.black
                        : BaseColors.black.withOpacity(0.1)),
                child: Center(
                  child: Text(
                    'Login',
                    style: fontSFProMedium.copyWith(
                      fontSize: 14,
                      color: controller.canLogin.value
                          ? BaseColors.white
                          : BaseColors.lightGray,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  'Continued consent',
                  style: fontSFProMedium.copyWith(
                    fontSize: 14,
                    color: BaseColors.lightGray,
                  ),
                ),
                Text(
                  'Agreements/Privacy Agreements',
                  style: fontSFProMedium.copyWith(
                    fontSize: 14,
                    color: BaseColors.black,
                  ),
                ),
                const Spacer(),
              ],
            )
          ],
        ));
  }
}
