import 'package:dgpt/screens/splash/splash_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:dgpt/widget/form/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BaseScreen(
      backgroundColor: BaseColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: defaultPadding * 2, right: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/tab/home_inactive.png",
              width: 40,
            ),
            const SizedBox(height: defaultPadding,),
            Text(
              'DGPT',
              style: fontSFProMedium.copyWith(
                fontSize: 18,
                color: BaseColors.white,
              ),
            ),
            const SizedBox(height: defaultPadding,),
            Text(
              'Collect idle computing power \nProvide a source of profit for each computing power provider',
              style: fontSFProMedium.copyWith(
                fontSize: 14,
                color: BaseColors.white,
              ),
            ),
            const Spacer(),
            SafeArea(
              child: Row(
                children: [
                  Expanded(child: Container()),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.login);
                    },
                    child: Container(
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.circular(10),
                        color: BaseColors.black
                      ),
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(
                            'Start',
                            style: fontSFProMedium.copyWith(
                              fontSize: 14,
                              color: BaseColors.white,
                            ),
                          ),
                          const SizedBox(width: defaultPadding / 4,),
                          const Icon(Icons.arrow_right_alt_rounded, color: BaseColors.white),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

}
