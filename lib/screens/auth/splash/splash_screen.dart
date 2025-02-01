import 'package:dgpt/screens/auth/splash/splash_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.baseBackgroundImage,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: Container()),
              Image.asset(
                'assets/images/custom/splash_bg.png',
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  '通过DePIN网络为人工智能提供无缝计\n算能力连接。',
                  style: fontDMRegular.copyWith(
                    fontSize: 18,
                    color: BaseColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                SafeArea(
                  child: BaseButton(
                    height: 56,
                    customDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                        border: Border.all(
                            color: Colors.purpleAccent,
                            width: 1
                        )
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    style: fontDMBold.copyWith(
                      fontSize: 16,
                      color: BaseColors.white,
                    ),
                    text: '开始',
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }

}
