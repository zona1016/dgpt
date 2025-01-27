import 'package:dgpt/screens/notice/system_message_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_network_image.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemMessageScreen extends GetView<SystemMessageScreenController> {
  const SystemMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        title: 'System Message',
        color: BaseColors.white,
        backgroundColor: Colors.black,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
              color: BaseColors.black,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                                "assets/images/tab/profile_active.png",
                                width: 60),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.red
                                ),
                                child: Center(
                                  child: Text(
                                    '99',
                                    style: fontSFProMedium.copyWith(
                                        color: BaseColors.white,
                                        fontSize: 14
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: defaultPadding / 2,),
                        Text(
                          'Update',
                          style: fontSFProMedium.copyWith(
                            color: BaseColors.white,
                            fontSize: 14
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                            "assets/images/tab/profile_active.png",
                            width: 60),
                        const SizedBox(height: defaultPadding / 2,),
                        Text(
                          'Service',
                          style: fontSFProMedium.copyWith(
                              color: BaseColors.white,
                              fontSize: 14
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(
                            "assets/images/tab/profile_active.png",
                            width: 60),
                        const SizedBox(height: defaultPadding / 2,),
                        Text(
                          'Announcement',
                          style: fontSFProMedium.copyWith(
                              color: BaseColors.white,
                              fontSize: 14
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding / 2,),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (_, index) {
                return _item(context);
              },
            )
          ],
        ),
      ),
    );
  }

  _item(context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.systemMessageDetail);
      },
      child: Container(
        color: BaseColors.black,
        padding: const EdgeInsets.symmetric(vertical: defaultPadding, horizontal: defaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                "assets/images/tab/profile_active.png",
                width: 60),
            const SizedBox(width: defaultPadding / 2,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Successfully purchased the package',
                    style: fontSFProMedium.copyWith(
                        color: BaseColors.white,
                        fontSize: 14
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2,),
                  Text(
                    '2025-01-19 20:36:49',
                    style: fontSFProMedium.copyWith(
                        color: BaseColors.white,
                        fontSize: 14
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2,),
                  Text(
                    'You have successfully purchased the Accelerator package',
                    style: fontSFProMedium.copyWith(
                        color: BaseColors.white,
                        fontSize: 14
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
