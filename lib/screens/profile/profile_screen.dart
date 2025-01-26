import 'package:dgpt/screens/profile/profile_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileScreenController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BaseScreen(
      backgroundColor: Colors.black,
      appBar: BaseAppBar(
        color: Colors.black,
        backgroundColor: Colors.black,
        title: '',
        actions: [
          InkWell(
            onTap: () => Get.toNamed(AppRoutes.accountProfile),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.greenAccent, size: 35,),
                  onPressed: () {},
                ),
                const SizedBox(width: defaultPadding / 2,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      'ceshi01',
                      style: fontSFProMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.white,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'UID: 38325008',
                      style: fontSFProMedium.copyWith(
                        fontSize: 14,
                        color: BaseColors.weakTextColor,
                      ),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.greenAccent, size: 35,),
            onPressed: () {},
          ),
          const SizedBox(width: defaultPadding / 2,),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.greenAccent, size: 35,),
            onPressed: () => Get.toNamed(AppRoutes.setting),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: defaultPadding),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: defaultPadding/2,),
                        Text(
                          'My Total Asset(USDT)',
                          style: fontSFProMedium.copyWith(
                            fontSize: 14,
                            color: BaseColors.white,
                          ),
                        ),
                        const SizedBox(height: defaultPadding/2,),
                        Text(
                          '27614.272 USDT',
                          style: fontSFProMedium.copyWith(
                            fontSize: 14,
                            color: BaseColors.weakTextColor,
                          ),
                        ),
                        const SizedBox(height: defaultPadding/2,),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: BaseButton(
                      text: 'Asset center',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              const SizedBox(height: defaultPadding),
              Container(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    width: 1,
                    color: BaseColors.primaryColor
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: defaultPadding/2,),
                          Text(
                            'Task',
                            style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.white,
                            ),
                          ),
                          const SizedBox(height: defaultPadding/2,),
                          Text(
                            '27614.272 USDT',
                            style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.weakTextColor,
                            ),
                          ),
                          const SizedBox(height: defaultPadding/2,),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      width: 1,
                      height: 25,
                      color: BaseColors.primaryColor,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: defaultPadding/2,),
                          Text(
                            'Vault',
                            style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.white,
                            ),
                          ),
                          const SizedBox(height: defaultPadding/2,),
                          Text(
                            '27614.272 USDT',
                            style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.weakTextColor,
                            ),
                          ),
                          const SizedBox(height: defaultPadding/2,),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      width: 1,
                      height: 25,
                      color: BaseColors.primaryColor,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: defaultPadding/2,),
                          Text(
                            'Withdrawal',
                            style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.white,
                            ),
                          ),
                          const SizedBox(height: defaultPadding/2,),
                          Text(
                            '27614.272 USDT',
                            style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.weakTextColor,
                            ),
                          ),
                          const SizedBox(height: defaultPadding/2,),
                        ],
                      ),
                    ),
                  ],
                )
              ),
              const SizedBox(height: defaultPadding),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.profileList.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:

                          break;
                        case 1:

                          break;
                        case 2:

                          break;
                        case 3:

                          break;
                        case 4:

                          break;
                        case 5:

                          break;
                        case 6:

                          break;
                        case 7:

                          break;
                        case 8:

                          break;
                        case 9:

                          break;
                        case 10:

                          break;
                        default:
                      }
                    },
                    child: SizedBox(
                      height: 44,
                      child: Row(
                        children: [
                          Icon(Icons.add, color: Colors.white,),
                          SizedBox(width: defaultPadding / 4,),
                          Text(
                            controller.profileList[index],
                            style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.white,
                            ),
                          ),
                          Expanded(child: Container()),
                          Icon(Icons.chevron_right_sharp, size: 24, color: Colors.white,),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
