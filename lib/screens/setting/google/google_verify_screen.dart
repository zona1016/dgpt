import 'package:dgpt/screens/setting/google/google_verify_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/packages/toast.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GoogleVerifyScreen extends GetView<GoogleVerifyScreenController> {
  const GoogleVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        title: '开启谷歌验证',
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Image.asset(
              'assets/images/home/google_tip.png',
              width: 160,
              height: 160,
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Text(
              '贴上密钥',
              style: fontDMMedium.copyWith(
                fontSize: 16,
                color: BaseColors.white,
              ),
            ),
            Text(
              '（Google Authenticator)',
              style: fontDMMedium.copyWith(
                fontSize: 16,
                color: BaseColors.white,
              ),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              children: [
                Text(
                  'Google验证码',
                  style: fontDMMedium.copyWith(
                    fontSize: 16,
                    color: BaseColors.white,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: defaultPadding / 4,
            ),
            GetBuilder<GoogleVerifyScreenController>(
              builder: (_) {
                return BaseTextFormField(
                  controller: controller.textController,
                  radius: 10,
                  name: 'auth',
                  style: fontDMMedium.copyWith(
                      color: BaseColors.white,
                      fontSize: 14
                  ),
                  fillColor: Colors.transparent,
                  inputBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: BaseColors.white.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(10)),
                  suffixIcon: GestureDetector(
                    onTap: () async {
                      try {
                        ClipboardData? data = await Clipboard.getData('text/plain');
                        controller.textController.text = data?.text ?? '';
                      } catch (e) {
                        controller.textController.text = '';
                      }
                      controller.update();
                    },
                    child: Container(
                      height: 26,
                      width: 56,
                      padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
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
                      child: Center(
                        child: Text(
                          '贴上',
                          style: fontDMMedium.copyWith(
                            fontSize: 14,
                            color: BaseColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    controller.textController.text = value ?? '';
                    controller.update();
                  },
                );
              },
            ),
            Expanded(child: Container()),
            GetBuilder<GoogleVerifyScreenController>(
              builder: (_) {
                return BaseButton(
                  enabled: controller.textController.text.isNotEmpty,
                  onPressed: () => controller.confirm(),
                  text: tr('button.complete'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
