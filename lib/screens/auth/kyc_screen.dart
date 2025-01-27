import 'package:dgpt/screens/auth/kyc_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KycScreen extends GetView<KycScreenController> {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: 'Order details',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(defaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: BaseColors.black
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Real Name',
                    style: fontSFProMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.white,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'DGPT',
                      style: fontSFProMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding,),
              Row(
                children: [
                  Text(
                    'ID card',
                    style: fontSFProMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.white,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'DGPT',
                      style: fontSFProMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding,),
              Text(
                'Front of ID card',
                style: fontSFProMedium.copyWith(
                  fontSize: 14,
                  color: BaseColors.white,
                ),
              ),
              const SizedBox(height: defaultPadding,),
              GestureDetector(
                onTap: () async {
                  await controller.onPickCoverImage(context: context);
                },
                child: SizedBox(
                  height: Get.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const AspectRatio(
                      aspectRatio: 1,
                      child: BaseNetworkImage(
                        imageURL: '',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding,),
              Row(
                children: [
                  Expanded(
                    child: BaseButton(
                      enabled: false,
                      onPressed: () {},
                      text: 'Cancel',
                    ),
                  ),
                  const SizedBox(width: defaultPadding,),
                  Expanded(
                    child: BaseButton(
                      onPressed: () {},
                      text: 'Submit',
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
