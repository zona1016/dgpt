import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/screens/auth/register_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/email_verification_button.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:dgpt/widget/form/borderless_text_field.dart';
import 'package:dgpt/widget/form/custom_form_builder_validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class RegisterScreenArgs {
  final String? referralCode;

  RegisterScreenArgs({required this.referralCode});
}

class RegisterScreen extends GetView<RegisterScreenController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        backgroundColor: BaseColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: _buildHeaderDetail(),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: FormBuilder(
                  key: controller.registerFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      BaseTextFormField(
                        name: "account",
                        hintText: 'Account',
                        validator: FormBuilderValidators.compose([
                          CustomFormBuilderValidators.required('Account')
                        ]),
                      ),
                      const SizedBox(height: 20),
                      BaseTextFormField(
                        name: "email",
                        hintText: 'Email',
                        validator: FormBuilderValidators.compose([
                          CustomFormBuilderValidators.required('Email'),
                          CustomFormBuilderValidators.email()
                        ]),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      _enterMobile(context),
                      const SizedBox(height: 20),
                      BaseTextFormField(
                        name: "password",
                        hintText: 'Password',
                        validator: FormBuilderValidators.compose([
                          CustomFormBuilderValidators.required('Password'),
                          CustomFormBuilderValidators.password()
                        ]),
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      Obx(() => BaseTextFormField(
                            name: "confirmPassword",
                            autovalidateMode: controller.isFormValidated.isTrue
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            hintText: 'ConfirmPassword',
                            validator: (value) => controller
                                        .registerFormKey
                                        .currentState
                                        ?.fields['password']
                                        ?.value !=
                                    value
                                ? 'Password not match'
                                : null,
                            obscureText: true,
                          )),
                      const SizedBox(height: 20),
                      BaseTextFormField(
                        name: "inviteCode",
                        hintText: 'InviteCode',
                        validator: FormBuilderValidators.compose([
                          CustomFormBuilderValidators.required('InviteCode'),
                        ]),
                      ),
                      const SizedBox(height: 20),
                      _buildRegister(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
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

  _buildRegister() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.register();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: defaultPadding),
            height: 44,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: BaseColors.black),
            child: Center(
              child: Text(
                'Login',
                style: fontSFProMedium.copyWith(
                  fontSize: 14,
                  color: BaseColors.white,
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
    );
  }
}
