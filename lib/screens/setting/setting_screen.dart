import 'package:dgpt/screens/setting/setting_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends GetView<SettingScreenController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: '',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.settingList.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                case 1:
                case 2:
                case 3:
                  Get.toNamed(AppRoutes.accountProfile);
                  break;
                case 4:

                  break;
                case 5:

                  break;
                default:
              }
            },
            child: SizedBox(
              height: 60,
              child: Row(
                children: [
                  Icon(Icons.add, color: Colors.white,),
                  SizedBox(width: defaultPadding / 4,),
                  Text(
                    controller.settingList[index],
                    style: fontSFProMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.white,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    controller.settingList[index],
                    style: fontSFProMedium.copyWith(
                      fontSize: 14,
                      color: BaseColors.weakTextColor,
                    ),
                  ),
                  Icon(Icons.chevron_right_sharp, size: 24, color: Colors.white,),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
