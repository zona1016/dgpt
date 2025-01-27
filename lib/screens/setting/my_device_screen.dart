import 'package:dgpt/screens/setting/my_device_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDeviceScreen extends GetView<MyDeviceScreenController> {
  const MyDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: 'My Device',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
      ),
      body: Obx(() => Container(
        margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: BoxDecoration(
            color: BaseColors.black,
            borderRadius: BorderRadius.circular(25)
        ),
        child: ListView.builder(
          itemCount: controller.deviceMap.keys.length,
          itemBuilder: (_, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: defaultPadding),
                Text(
                  controller.deviceMap.keys.toList()[index],
                  style: fontSFProMedium.copyWith(
                    fontSize: 14,
                    color: BaseColors.white,
                  ),
                ),
                const SizedBox(height: defaultPadding / 2,),
                Text(
                  controller.deviceMap.values.toList()[index],
                  style: fontSFProMedium.copyWith(
                    fontSize: 14,
                    color: BaseColors.weakTextColor,
                  ),
                ),
              ],
            );
          },
        ),
      )),
    );
  }

}
