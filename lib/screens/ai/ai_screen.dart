import 'package:dgpt/screens/ai/ai_screen_controller.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/widget/base/base_app_bar.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiScreen extends GetView<AiScreenController> {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.customBackgroundImage,
      appBar: BaseAppBar(
        color: BaseColors.white,
        backgroundColor: Colors.transparent,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Colors.transparent),
        ),
        title: '',
        actions: [
          IconButton(
            icon: Image.asset(
              "assets/images/custom/logo.png",
              width: 25,
              height: 26,
            ),
            onPressed: () => Get.close(2),
          ),
        ],
        onBackTap: () {
          Get.back();
          Get.back();
        },
      ),
      body: Container(),
    );
  }
}
