import 'package:dgpt/screens/setting/help_center_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends GetView<HelpCenterScreenController> {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black.withOpacity(0.8),
      backgroundImage: 'assets/images/home/help_center.png',
      appBar: const BaseAppBar(
        title: '帮助中心',
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '给我们留言',
                    style: fontDMBold.copyWith(
                        color: BaseColors.white, fontSize: 32),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Image.asset(
                    'assets/images/home/help_top.png',
                    width: 250,
                    height: 250,
                  ),
                  Text(
                    '您好！非常抱歉，我们暂时无法为您提供服务。如果您需要帮助，请留下信息，我们将会尽快与您联系并提供解决方案！',
                    style: fontDMMedium.copyWith(
                        color: BaseColors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  BaseTextFormField(
                    name: 'phone',
                    hintText: '手机号',
                    fillColor: BaseColors.gray85,
                    radius: 10,
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  BaseTextFormField(
                    name: 'phone',
                    hintText: '信息',
                    fillColor: BaseColors.gray85,
                    radius: 10,
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 150,
                        color: BaseColors.gray85,
                      ),
                      const SizedBox(
                        width: defaultPadding / 2,
                      ),
                      Expanded(
                        child: Text(
                          '您可上传图像不超过 5MB 的图片。',
                          style: fontDMMedium.copyWith(
                              color: BaseColors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
          _buildConfirm()
        ],
      ),
    );
  }

  _buildConfirm() {
    return BaseButton(
      onPressed: () {},
      disabledDecoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30)),
      enabled: true,
      text: tr('button.confirm'),
    );
  }
}
