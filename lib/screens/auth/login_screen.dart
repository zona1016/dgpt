import 'package:dgpt/screens/auth/login_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginScreenController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: BaseColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _buildHeader(),
            ),
            SliverFillRemaining(
              hasScrollBody: false, // 如果不需要滚动内容，设置为 false
              child: Column(
                children: [
                  Expanded(child: Container()),
                  _buildBottom()
                ],
              ), // 或者其他你想占位的内容
            ),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderDetail(),
          const SizedBox(
            height: defaultPadding,
          ),
          _buildNameAndPassword(),
          const SizedBox(
            height: defaultPadding,
          ),
          Row(
            children: [
              Text(
                'Forget password?',
                style: fontSFProMedium.copyWith(
                  fontSize: 14,
                  color: BaseColors.lightGray,
                ),
              ),
              const Spacer(),
              Text(
                'No account?Register',
                style: fontSFProMedium.copyWith(
                    fontSize: 14,
                    color: BaseColors.lightGray,
                    decoration: TextDecoration.underline,
                    decorationColor: BaseColors.white),
              ),
            ],
          ),
          _buildLogin(),
        ],
      ),
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

  _buildNameAndPassword() {
    return Column(
      children: [
        BaseTextFormField(
          name: 'userName',
          hintText: 'Username/Email',
          fillColor: BaseColors.black,
          radius: 10,
          onChanged: (value) {
            controller.userName = value ?? '';
            controller.canLogin.value = controller.password.isNotEmpty && controller.userName.isNotEmpty;
          },
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        BaseTextFormField(
          name: 'password',
          hintText: 'Password',
          obscureText: true,
          fillColor: BaseColors.black,
          radius: 10,
          onChanged: (value) {
            controller.password = value ?? '';
            controller.canLogin.value = controller.password.isNotEmpty && controller.userName.isNotEmpty;
          },
        ),
      ],
    );
  }

  _buildLogin() {
    return Obx(() => Column(
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
                  color: controller.canLogin.value ? BaseColors.white : BaseColors.lightGray,
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
