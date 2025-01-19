import 'package:dgpt/screens/auth/login_screen_controller.dart';
import 'package:dgpt/utils/extensions/context_extension.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_auth_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:dgpt/widget/form/custom_form_builder_validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        appBar: const BaseAuthAppBar(),
        backgroundColor: Colors.transparent,
        backgroundImage: context.appTheme.loginBg,
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: FormBuilder(
                key: controller.loginFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.5,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FractionallySizedBox(
                                widthFactor: 0.25,
                                child: Image.asset("assets/image/logo.png"),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                tr("auth.login_title"),
                                style: fontBold.copyWith(fontSize: 24),
                              )
                            ],
                          ),
                        ),
                      ),
                      BaseTextFormField(
                        name: "username",
                        hintText: tr("profile.info.username"),
                        validator: FormBuilderValidators.compose([
                          CustomFormBuilderValidators.required(
                              tr("profile.info.username"))
                        ]),
                        prefixIcon: Image.asset(
                            "assets/image/form/username.png",
                            color: context.appTheme.textColor),
                      ),
                      const SizedBox(height: 25),
                      BaseTextFormField(
                        name: "password",
                        hintText: tr("profile.info.password"),
                        validator: FormBuilderValidators.compose([
                          CustomFormBuilderValidators.required(
                              tr("profile.info.password"))
                        ]),
                        // initialValue: "@qweQWEQWE123",
                        obscureText: true,
                        prefixIcon: Image.asset(
                            "assets/image/form/password.png",
                            color: context.appTheme.textColor),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {},
                          behavior: HitTestBehavior.opaque,
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: Text(
                              tr("button.forgot_password"),
                              style: fontMedium.copyWith(fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      FractionallySizedBox(
                        widthFactor: 0.5,
                        child: BaseButton(
                            onPressed: () {
                              controller.login();
                            },
                            text: tr("button.login")),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
