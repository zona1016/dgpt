import 'dart:io';

import 'package:dgpt/screens/setting/help_center_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends GetView<HelpCenterScreenController> {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: 'assets/images/home/help_center.png',
      backgroundImageColor: Colors.black,
      appBar: BaseAppBar(
        title: tr('help.help_center'),
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
                    tr('help.leave_message'),
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
                    tr('help.sorry_message'),
                    style: fontDMMedium.copyWith(
                        color: BaseColors.white, fontSize: 16),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  BaseTextFormField(
                    name: 'phone',
                    hintText: tr('profile.phone_number'),
                    fillColor: BaseColors.gray85,
                    radius: 10,
                    onChanged: (value) {
                      controller.phone.value = value ?? '';
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  BaseTextFormField(
                    name: 'phone',
                    hintText: tr('help.information'),
                    fillColor: BaseColors.gray85,
                    radius: 10,
                    onChanged: (value) {
                      controller.content.value = value ?? '';
                    },
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Obx(() => Row(
                        children: [
                          if (controller.pickedFilePath.isEmpty)
                            GestureDetector(
                              onTap: () =>
                                  controller.onPickCoverImage(context: context),
                              child: Container(
                                height: 100,
                                width: 150,
                                color: BaseColors.gray85,
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      tr('button.upload'),
                                      style: fontDMMedium.copyWith(
                                          color: BaseColors.weakTextColor,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      '+',
                                      style: fontDMBold.copyWith(
                                          color: BaseColors.weakTextColor,
                                          fontSize: 26),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          if (controller.pickedFilePath.isNotEmpty)
                            kIsWeb
                                ? Image.memory(
                                    controller.imageData as Uint8List,
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 150,
                                  )
                                : Image.file(
                                    File(controller.pickedFilePath.value),
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 150,
                                  ),
                          const SizedBox(
                            width: defaultPadding / 2,
                          ),
                          Expanded(
                            child: Text(
                              tr('help.upload_image_limit'),
                              style: fontDMMedium.copyWith(
                                  color: BaseColors.white, fontSize: 14),
                            ),
                          ),
                        ],
                      ))
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
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: BaseButton(
        enabled: controller.phone.isNotEmpty &&
            controller.content.isNotEmpty &&
            controller.pickedFilePath.isNotEmpty,
        onPressed: () => controller.aiPulseCommonUploadImageFile(),
        text: tr('button.confirm'),
      ),
    ));
  }
}
