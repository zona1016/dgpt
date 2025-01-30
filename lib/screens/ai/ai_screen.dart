import 'package:dgpt/screens/ai/ai_screen_controller.dart';
import 'package:dgpt/utils/theme/color.dart';
import 'package:dgpt/widget/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AiScreen extends GetView<AiScreenController> {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundColor: Colors.transparent,
      backgroundImage: BaseColors.baseBackgroundImage,
      body: Container(),
    );
  }

}