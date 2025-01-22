import 'dart:async';

import 'package:dgpt/screens/auth/register_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/email_verification_button.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
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
                        name: "username",
                        hintText: 'Username',
                        validator: FormBuilderValidators.compose([
                          CustomFormBuilderValidators.required('Username')
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
                      BaseTextFormField(
                        name: "email_code",
                        hintText: 'Enter email code',
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.compose([
                          CustomFormBuilderValidators.required(
                              tr("verification.verification_code"))
                        ]),
                        suffixIcon: EmailVerificationButton(
                          formKey: controller.registerFormKey,
                          type: 'register',
                        ),
                        prefixIcon: Image.asset(
                            "assets/images/form/verification.png",
                            color: context.appTheme.textColor),
                      ),
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
                            name: "confirm_password",
                            autovalidateMode: controller.isFormValidated.isTrue
                                ? AutovalidateMode.onUserInteraction
                                : AutovalidateMode.disabled,
                            hintText: 'Place enter your password again',
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
                        name: "invitation_code",
                        hintText: 'Place enter the invitation code',
                        validator: FormBuilderValidators.compose([
                          CustomFormBuilderValidators.required('Place enter the invitation code'),
                        ]),
                      ),
                      const SizedBox(height: 20),
                      _buildRegister(),
                      const SizedBox(height: 20),
                      _buildBottom()
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

  _buildRegister() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {

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

  _buildBottom() {
    return Column(
      children: [
        Text(
          'Provide a revenue stream for each computing power provider！',
          style: fontSFProMedium.copyWith(
            fontSize: 14,
            color: BaseColors.lightGray,
          ),
        ),
        const SizedBox(height: defaultPadding,),
        Text(
          'Version 1.3.5',
          style: fontSFProMedium.copyWith(
            fontSize: 14,
            color: BaseColors.lightGray,
          ),
        ),
      ],
    );
  }
}
