import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dgpt/screens/setting/kyc_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KycScreen extends GetView<KycScreenController> {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: const BaseAppBar(title: 'KYC', color: BaseColors.white),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Obx(() => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr('home.select_country_or_region_for_document_issuance'),
                    style: fontDMRegular.copyWith(
                      fontSize: 16,
                      color: BaseColors.white,
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  _countryCodePicker(),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  _detail(),
                  const SizedBox(
                    height: defaultPadding / 4,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (controller.pickedFilePath.value.isEmpty &&
                          (controller.userKYCInfo.value == null ||
                              (controller.userKYCInfo.value != null &&
                                  controller.userKYCInfo.value?.status == 2))) {
                        await controller.onPickCoverImage(context: context);
                      }
                    },
                    child: Stack(
                      children: [
                        _updateWidget(),
                        _imageStatus(),
                        if (controller.userKYCInfo.value == null ||
                            (controller.userKYCInfo.value != null &&
                                controller.userKYCInfo.value?.status == 2))
                          _closeWidget(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding / 4,
                  ),
                  if (controller.userKYCInfo.value == null)
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 40,
                          child: BaseButton(
                            type: BaseButtonType.secondary,
                            onPressed: () => Get.back(),
                            text: tr('button.cancel'),
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: BaseButton(
                              onPressed: () =>
                                  controller.aiPulseCommonUploadImageFile(),
                              text: tr('button.submit'),
                            ),
                          ),
                        )
                      ],
                    ),
                ],
              ),
            )),
      ),
    );
  }

  _updateWidget() {
    if (controller.pickedFilePath.value.isEmpty) {
      return Image.asset(
        'assets/images/home/kyc_scwj_bg.png',
        width: double.infinity,
      );
    } else {
      if (controller.pickedFilePath.value.contains('http')) {
        return BaseNetworkImage(
          imageURL: controller.pickedFilePath.value,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        );
      } else {
        Image.file(
          File(controller.pickedFilePath.value),
          width: double.infinity,
          fit: BoxFit.fitWidth,
        );
      }
    }
  }

  _imageStatus() {
    String statusImage = '';
    String statusName = '';
    if (controller.userKYCInfo.value == null) {
      statusImage = 'kyc_sctp';
      statusName = '上传文件';
    } else {
      // 0待审核，1通过，2否定
      if (controller.userKYCInfo.value?.status == 0) {
        statusImage = 'kyc_ddrztg';
        statusName = '等待通过认证';
      } else if (controller.userKYCInfo.value?.status == 1) {
        statusImage = 'kyc_yrz';
        statusName = '已认证';
      } else if (controller.userKYCInfo.value?.status == 2) {
        statusImage = 'kyc_fd';
        statusName = '认证失败';
      }
    }

    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/home/$statusImage.png',
            height: 50,
            width: 50,
          ),
          Text(
            statusName,
            style: fontDMBold.copyWith(
              fontSize: 16,
              color: BaseColors.white,
            ),
          ),
        ],
      ),
    );
  }

  _closeWidget() {
    return Positioned(
      top: 10,
      right: 10,
      child: GestureDetector(
        onTap: () {
          controller.pickedFilePath.value = '';
        },
        child: Container(
          color: BaseColors.primaryColor,
          child: const Icon(
            Icons.close,
            color: BaseColors.white,
            size: 30,
          ),
        ),
      ),
    );
  }

  _cardType() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: GetBuilder<KycScreenController>(
        builder: (_) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 每行3个
                crossAxisSpacing: 10, // 横向间距
                mainAxisSpacing: 10,
                childAspectRatio: 3 // 纵向间距
                ),
            itemCount: controller.documents.length,
            itemBuilder: (context, index) {
              bool isSelected = controller.selectedIndex.value == index;
              return GestureDetector(
                onTap: () {
                  if (controller.userKYCInfo.value == null) {
                    controller.selectItem(index);
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected ? Colors.white : Colors.grey,
                      )),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Image.asset(
                        controller.documentsImages[index],
                        width: 25,
                        height: 25,
                        color: isSelected ? Colors.white : Colors.grey,
                      ),
                      const SizedBox(
                        width: defaultPadding / 2,
                      ),
                      Text(
                        controller.documents[index],
                        style: fontDMRegular.copyWith(
                            color: isSelected ? Colors.white : Colors.grey,
                            fontSize: 16),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/home/${isSelected ? 'kyc_selected' : 'kyc_unselected'}.png',
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  _detail() {
    return Column(
      children: [
        Text(
          tr('home.select_document_type'),
          style: fontDMRegular.copyWith(
            fontSize: 16,
            color: BaseColors.white,
          ),
        ),
        _cardType(),
        Text(
          tr('home.capture_passport_photo_requirements'),
          style: fontDMRegular.copyWith(
            fontSize: 12,
            color: BaseColors.white,
          ),
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        Text(
          tr('home.requirement_bright_and_clear'),
          style: fontDMBold.copyWith(
            fontSize: 12,
            color: BaseColors.white,
          ),
        ),
        Text(
          tr('home.requirement_no_cropping'),
          style: fontDMBold.copyWith(
            fontSize: 12,
            color: BaseColors.white,
          ),
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        Image.asset(
          'assets/images/home/kyc_correct.png',
          width: double.infinity,
        ),
        const SizedBox(
          height: defaultPadding / 4,
        ),
        Row(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/home/kyc_error.png',
              ),
            ),
            const SizedBox(
              width: defaultPadding / 4,
            ),
            Expanded(
              child: Image.asset(
                'assets/images/home/kyc_error1.png',
              ),
            ),
          ],
        ),
      ],
    );
  }

  _countryCodePicker() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: BaseColors.white, width: 1)),
      child: Row(
        children: [
          Expanded(
            child: CountryCodePicker(
              enabled: controller.userKYCInfo.value == null,
              showCountryOnly: true,
              alignLeft: true,
              showOnlyCountryWhenClosed: true,
              onChanged: (country) {
                controller.countryCode.value = country;
              },
              textStyle: fontDMRegular.copyWith(
                fontSize: 16,
                color: BaseColors.white,
              ),
              initialSelection: controller.countryCode.value.code,
            ),
          ),
          const Icon(
            Icons.chevron_right,
            size: 25,
            color: BaseColors.white,
          ),
          const SizedBox(
            width: defaultPadding,
          ),
        ],
      ),
    );
  }
}
