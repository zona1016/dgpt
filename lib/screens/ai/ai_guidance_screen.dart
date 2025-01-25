import 'package:dgpt/screens/ai/ai_guidance_screen_controller.dart';
import 'package:dgpt/utils/constants/app_default_size.dart';
import 'package:dgpt/utils/routes/app_routes.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/utils/theme/typography.dart';
import 'package:dgpt/widget/base/base_button.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiGuidanceScreen extends GetView<AiGuidanceScreenController> {
  const AiGuidanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.black,
      body: Obx(() => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            const SizedBox(height: defaultPadding * 3,),
            Image.asset(
              "assets/images/tab/home_inactive.png",
              width: 80,
            ),
            const SizedBox(height: defaultPadding * 2,),
            AnimatedOpacity(
              opacity: controller.headerVisible.value ? 1.0 : 0.0,  // 根据 _isVisible 来控制透明度
              duration: const Duration(seconds: 1),  // 动画持续 1 秒
              curve: Curves.easeInOut,  // 动画曲线
              child: Text(
                'Welcome to \nDGPT-AI',
                style: fontSFProBold.copyWith(
                  fontSize: 20,
                  color: BaseColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: defaultPadding,),
            AnimatedOpacity(
              opacity: controller.detailVisible.value ? 1.0 : 0.0,  // 根据 _isVisible 来控制透明度
              duration: const Duration(seconds: 1),  // 动画持续 1 秒
              curve: Curves.easeInOut,  // 动画曲线
              child: Text(
                'Ask anything, get your answer',
                style: fontSFProBold.copyWith(
                  fontSize: 14,
                  color: BaseColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            AnimatedOpacity(
              opacity: controller.otherVisible.value ? 1.0 : 0.0,  // 根据 _isVisible 来控制透明度
              duration: const Duration(seconds: 1),  // 动画持续 1 秒
              curve: Curves.easeInOut,  // 动画曲线
              child: Image.asset(
                "assets/images/tab/home_inactive.png",
                width: 44,
              ),
            ),
            const SizedBox(height: defaultPadding,),
            AnimatedOpacity(
              opacity: controller.otherVisible.value ? 1.0 : 0.0,  // 根据 _isVisible 来控制透明度
              duration: const Duration(seconds: 1),  // 动画持续 1 秒
              curve: Curves.easeInOut,  // 动画曲线
              child: Text(
                'Examples',
                style: fontSFProBold.copyWith(
                  fontSize: 20,
                  color: BaseColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: defaultPadding * 3,),
            SafeArea(
              child: AnimatedOpacity(
                opacity: controller.otherVisible.value ? 1.0 : 0.0,  // 根据 _isVisible 来控制透明度
                duration: const Duration(seconds: 1),  // 动画持续 1 秒
                curve: Curves.easeInOut,  // 动画曲线
                child: BaseButton(
                  text: 'Next',
                  onPressed: () => Get.toNamed(AppRoutes.aiStart),
                  type: BaseButtonType.golden,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

}